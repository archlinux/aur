# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=vdr-checkts
pkgver=0.1
pkgrel=2
pkgdesc="Tool to check VDR recordings for errors"
url='https://github.com/vdr-projects/vdr-checkts'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('BSD')
depends=('gcc-libs' 'glibc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('ff2d6ae19cb4ed1ddef3a2828c73086b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 vdr-checkts "$pkgdir/usr/bin/vdr-checkts"
  install -Dm644 COPYRIGHT   "$pkgdir/usr/share/licenses/${pkgname}/COPYRIGHT"
}
