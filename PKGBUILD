# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient
pkgver=1.17.1
pkgrel=1
pkgdesc="A terminal client for hack.chat"
arch=("x86_64")
url="https://github.com/AnnikaV9/hcclient"
license=("Unlicense")
provides=("hcclient")
makedepends=("python" "binutils")
source=("v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('be7b5430ad24b5a8886f22f1ca4ac00b65b2029c275885b3b85cce5ac1c7ca78')

build() {
  cd "${srcdir}/hcclient-${pkgver}"
  RELEASE_VERSION=true NO_STATIC=true NO_ANSI=true bash scripts/build.sh executable
}

package() {
  install -Dm755 "${srcdir}/hcclient-${pkgver}/dist/hcclient-${pkgver}" "${pkgdir}/usr/bin/hcclient"
  install -Dm644 "${srcdir}/hcclient-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/hcclient/LICENSE"
}
