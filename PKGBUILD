# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=mint
pkgver=0.27.0
pkgrel=1
pkgdesc='A refreshing language for the front-end web'
arch=('x86_64')
url='https://github.com/mint-lang/mint'
license=('BSD')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1960ea78acb5333f07e60beaaa3ea14ad2ac75640aaf11b61d245e814f53cb86')
makedepends=('shards')
conflicts=('mint-bin')

build() {
  cd "${pkgname}-${pkgver}"

  # Get dependencies and build binary
  PATH="/usr/bin" shards build  --production
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
