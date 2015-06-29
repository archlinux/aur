# Maintainer: Jan Hambrecht <jaham at gmx dot net>

pkgname=spnavcfg
pkgver=0.3
pkgrel=1
pkgdesc="The spacenav project provides a free, compatible alternative, to the proprietary 3Dconnexion device driver and SDK, for their 3D input devices (called 'space navigator', 'space pilot', 'space traveller', etc)."
arch=('i686' 'x86_64')
url="http://spacenav.sourceforge.net/"
license=('GPL')
makedepends=('gcc make')
provides=('spnavcfg')
options=()
install=
source=(http://downloads.sourceforge.net/spacenav/$pkgname-$pkgver.tar.gz)
md5sums=('ac4ac49b07c4a4dbfa6ba1cd0d357273')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install || return 1
}
