# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient
pkgver=1.14.0
pkgrel=1
pkgdesc="A terminal client for hack.chat"
arch=("x86_64")
url="https://github.com/AnnikaV9/hcclient"
license=("Unlicense")
provides=("hcclient")
makedepends=("python" "binutils")
source=("v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('49307f8d1d9f3852ea074c960a4e86b65935c03e350f8c5e9a3a8987f24b2dd9')

build() {
  cd "${srcdir}/hcclient-${pkgver}"
  RELEASE_VERSION=true bash scripts/build.sh executable
}

package() {
  install -Dm755 "${srcdir}/hcclient-${pkgver}/dist/hcclient-${pkgver}" "${pkgdir}/usr/bin/hcclient"
  install -Dm644 "${srcdir}/hcclient-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/hcclient/LICENSE"
}
