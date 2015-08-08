# Maintainer: Dan Panzarella <alsoelp@gmail.com>

pkgname=gtk-engine-unico
pkgrel=2
pkgver=1.0.1
pkgdesc="New GTK+ 3.0 theming engine by Andrea Cimitan"
arch=('i686' 'x86_64')
url="https://launchpad.net/unico"
license=('GPL')
makedepends=("gnome-common")
depends=("gtk3")
source=("http://launchpad.net/unico/1.0/$pkgver/+download/${pkgname#gtk-engine-}-$pkgver.tar.gz")
md5sums=('1e56ff86337120dcf1b04dd443ea4b71')
options=(!libtool)


build() {
  cd ${srcdir}/${pkgname#gtk-engine-}-$pkgver
  
  ./configure --prefix=/usr --disable-static

  make
}

package() {
  cd ${srcdir}/${pkgname#gtk-engine-}-$pkgver
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
