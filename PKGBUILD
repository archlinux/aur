# Maintainer: erdii <me at erdii dot engineering>
pkgname=lichen
pkgver=0.1.7
pkgrel=1
pkgdesc="Go binary license checker. Extracts module usage information from binaries and analyses their licenses."
arch=("any")
provides=("lichen")
conflicts=()
url="https://github.com/uw-labs/lichen"
license=("MIT")
depends=()
makedepends=("go")
source=("lichen-${pkgver}::git+https://github.com/uw-labs/lichen#tag=v${pkgver}")
sha256sums=('65af7c79df78471d296cabe5935323748afc57561568dd181f3f46a123e562b6')

build() {
  cd "${srcdir}/lichen-${pkgver}"
  go build -o lichen .
}

package() {
  install -Dm755 "${srcdir}/lichen-${pkgver}/lichen" "${pkgdir}/usr/bin/lichen"
}
