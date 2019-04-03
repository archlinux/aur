# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=linux_logo
pkgver=5.11
pkgrel=4
pkgdesc="Text-based logo and system information program"
arch=('x86_64')
url="http://www.deater.net/weave/vmwprod/linux_logo"
license=('GPL')
depends=('glibc')
source=(http://www.deater.net/weave/vmwprod/linux_logo/${pkgname}-${pkgver}.tar.gz)
sha512sums=('3c11d59eeb1ea613eb66d3ea5ef2d7c9ef906cb12430b9350570a6a1937ec174bdd974e6227358339c3fd2e0647a5066a0bea22289c4aa9bc8b03afb0033f114')

build() {
  cd ${pkgname}-${pkgver}
  find ./logos -type f | sort > logo_config
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make PREFIX="${pkgdir}/usr" install
}
