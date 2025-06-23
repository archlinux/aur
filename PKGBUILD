# Maintainer: wackbyte <im@purring.fyi>

pkgname=hare-toml
pkgver=0.2.0
pkgrel=1
pkgdesc='TOML implementation for Hare'
arch=('any')
url="https://codeberg.org/lunacb/${pkgname}"
license=('MIT')
depends=('hare')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('d9866946893926e95f4437251b0556fafd6b6f4d420f561481d3f57fb6f0b8b76846c985e5b0aba1d466d16173f327469fcd102e70fad855a8a4bd0fb65211e0')

check() {
  cd $pkgname

  make check
}

package() {
  cd $pkgname

  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
