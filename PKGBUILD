# Maintainer: wackbyte <im@purring.fyi>

pkgname=hare-toml
pkgver=0.2.1
pkgrel=1
pkgdesc='TOML implementation for Hare'
arch=('any')
url="https://codeberg.org/lunacb/${pkgname}"
license=('MIT')
depends=('hare')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('1a85c06ae10442f34a00dd9e76772a511dc49416e3aa28e9e45839f9b49879d47615f09645b9655d8232a7a8bb5f420e078b0a6d71b58dd041ce3918a202bfa7')

check() {
  cd $pkgname

  make check
}

package() {
  cd $pkgname

  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
