# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient
pkgver=1.16.2
pkgrel=1
pkgdesc="A terminal client for hack.chat"
arch=("x86_64")
url="https://github.com/AnnikaV9/hcclient"
license=("Unlicense")
provides=("hcclient")
makedepends=("python" "binutils")
source=("v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5a1268edbdee61435a679192765a04c1722dc264c9d0e791fda5aa3b5a7fa7d4')

build() {
  cd "${srcdir}/hcclient-${pkgver}"
  RELEASE_VERSION=true NO_STATIC=true NO_ANSI=true bash scripts/build.sh executable
}

package() {
  install -Dm755 "${srcdir}/hcclient-${pkgver}/dist/hcclient-${pkgver}" "${pkgdir}/usr/bin/hcclient"
  install -Dm644 "${srcdir}/hcclient-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/hcclient/LICENSE"
}
