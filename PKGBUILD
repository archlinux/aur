# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient
pkgver=1.16.4
pkgrel=1
pkgdesc="A terminal client for hack.chat"
arch=("x86_64")
url="https://github.com/AnnikaV9/hcclient"
license=("Unlicense")
provides=("hcclient")
makedepends=("python" "binutils")
source=("v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8673d5a487592178bd43bd0ef025a33333082e5328ece722f1b0cc0bac7e96a3')

build() {
  cd "${srcdir}/hcclient-${pkgver}"
  RELEASE_VERSION=true NO_STATIC=true NO_ANSI=true bash scripts/build.sh executable
}

package() {
  install -Dm755 "${srcdir}/hcclient-${pkgver}/dist/hcclient-${pkgver}" "${pkgdir}/usr/bin/hcclient"
  install -Dm644 "${srcdir}/hcclient-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/hcclient/LICENSE"
}
