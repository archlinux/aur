# Maintainer:
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Kieslich <tobias@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=obconf
pkgver=2.0.4
pkgrel=3
pkgdesc="A GTK2 based configuration tool for the Openbox windowmanager"
arch=('i686' 'x86_64')
url="http://openbox.org/wiki/ObConf:About"
license=('GPL')
depends=('openbox' 'gtk2' 'libglade' 'desktop-file-utils' 'libsm' 'libobrender.so')
install=${pkgname}.install
source=("http://openbox.org/dist/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('9271c5d2dc366d61f73665a5e8bceabc')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  #./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
