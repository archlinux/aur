# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=pessulus
pkgver=2.30.4
pkgrel=1
pkgdesc="A lockdown editor for GNOME"
arch=('any')
url="https://wiki.gnome.org/action/show/Apps/Attic/Pessulus"
license=('GPL')
depends=('python2-bonobo' 'python2-gconf' 'hicolor-icon-theme')
makedepends=('pkgconfig' 'gettext' 'intltool')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/2.30/$pkgname-$pkgver.tar.gz)
sha256sums=('887ebf0510f44430e3feb053242521218db07bbb623e6d07f7f4414812ceff06')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  export PYTHON=`which python2`
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
