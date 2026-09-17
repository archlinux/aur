# Maintainer: Samiul Quoreshi Sourav <sourav at l3v11.eu.org>

pkgname=dalfox-bin
_pkgname=${pkgname%-bin}
pkgver=3.2.3
pkgrel=1
pkgdesc="Powerful open-source XSS scanner and utility focused on automation (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/hahwul/dalfox"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source=("LICENSE.txt::https://github.com/hahwul/dalfox/raw/v${pkgver}/LICENSE.txt")
source_x86_64=("${_pkgname}-v${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${_pkgname}-v${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-aarch64.tar.gz")
sha256sums=('ffb8b51dc4186526fa4cc8226e458f8655dcfa2feed8e90a8543d77441b8e572')
sha256sums_x86_64=('3b059b6bb55e686b5f240852ea6a6750aa5e35a3b404e4027ffe505e2b60a470')
sha256sums_aarch64=('a7074d1001bb66664c1ed2db35d4b892a8f11da4d07f4deede1da8bfe7992d2b')

package() {
  install -Dm755 "$srcdir/${_pkgname}-v$pkgver-linux-$CARCH"/${_pkgname} "$pkgdir/usr/bin/${_pkgname}"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
