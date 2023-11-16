# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient
pkgver=1.12.1
pkgrel=1
pkgdesc="A terminal client for hack.chat"
arch=("x86_64")
url="https://github.com/AnnikaV9/hcclient"
license=("Unlicense")
provides=("hcclient")
makedepends=("python" "binutils")
source=("v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d06a5d6826fa66d752c9d1682ede1d349d63d208b0c0281b881ddfcaab8343c4')

build() {
  cd "${srcdir}/hcclient-${pkgver}"
  RELEASE_VERSION=true bash build.sh executable
}

package() {
  install -Dm755 "${srcdir}/hcclient-${pkgver}/dist/hcclient-${pkgver}" "${pkgdir}/usr/bin/hcclient"
  install -Dm644 "${srcdir}/hcclient-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/hcclient/LICENSE"
}
