# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>
# Contributor: Faustino Aguilar <faustinoaq.github.io>

pkgname=mint
pkgver=0.13.1
pkgrel=3
pkgdesc='A refreshing language for the front-end web'
arch=('x86_64')
url='https://github.com/mint-lang/mint'
license=('BSD')
makedepends=('shards')
source=("mint-${pkgver}::https://github.com/mint-lang/mint/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('35d1943d8deab5240471565ad90b0d26fe343baa69950ee87e03cfea61822f35')

build() {
  cd "mint-${pkgver}"
  PATH="/usr/bin" shards build --stats --progress --time --release --no-debug
}

package() {
  cd "mint-${pkgver}"
  install -Dm755 "bin/mint" "${pkgdir}/usr/bin/mint"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/mint/LICENSE"
}
