# Maintainer: Marco <marcomania2012 at gmail dot com>

pkgname=cnping
pkgver=1.0.0
pkgrel=1
pkgdesc='Minimal graphical IPv4 Ping / HTTP ping tool'
arch=('x86_64')
url="https://github.com/cntools/${pkgname}"
license=('custom:BSD3')
depends=('libxinerama>=1.1.4'
         'libxext>=1.3.4'
         'libglvnd>=1.4.0'
         'mesa')
makedepends=('autoconf'
             'automake'
             'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cntools/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('10718b62f15c16e782d57107157a70cd25b7338bfd3843376d8b3c73955137a08e54b0311c281734cdc5648bea27cf133cf6aa01389bb8ed075be4a69684c665')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm4755 cnping "$pkgdir/usr/bin/cnping"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
