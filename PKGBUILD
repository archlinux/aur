# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=mint
pkgver=0.29.0
pkgrel=1
pkgdesc='A refreshing language for the front-end web'
arch=('x86_64')
url='https://github.com/mint-lang/mint'
license=('BSD')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ac74611b1cf4737ab00e255ccdf64c9c21fb88d1a76157f54b83126416ff3113')
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
