# Maintainer: Samiul Quoreshi Sourav <sourav at l3v11.eu.org>

pkgname=dalfox-bin
_pkgname=${pkgname%-bin}
pkgver=3.1.2
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
sha256sums_x86_64=('ef48d30c183cead88eb89da10bdc1a7fa58a484d175319096075b470f3652fd4')
sha256sums_aarch64=('b61dc832582e738dc5b838197d28b6d0d4d33de2d849fc73741635fc380f0348')

package() {
  install -Dm755 "$srcdir/${_pkgname}-v$pkgver-linux-$CARCH"/${_pkgname} "$pkgdir/usr/bin/${_pkgname}"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
