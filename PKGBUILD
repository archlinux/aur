# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=mint
pkgver=0.28.1
pkgrel=1
pkgdesc='A refreshing language for the front-end web'
arch=('x86_64')
url='https://github.com/mint-lang/mint'
license=('BSD')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fe4bd9fb4aaf1cd7bac518bc7251ea65e68f27dd20d2db04124b8b9110179dd0')
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
