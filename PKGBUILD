# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=trzsz-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="The go version of trzsz, makes all terminals that support local shell to support trzsz ( trz / tsz ).(Prebuilt version)"
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://trzsz.github.io/go"
_ghurl="https://github.com/trzsz/trzsz-go"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/trzsz/trzsz-go/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_aarch64.rpm")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv7.rpm")
source_i686=("${pkgname%-bin}-${pkgver}-i686.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_i386.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_x86_64.rpm")
sha256sums=('30fbfa725e8534e0f14891463caa18acf797242ed834801b74d2fdb8476b7eda')
sha256sums_aarch64=('1357409bbed43b9eb2f756bb4e7d980044b0956e33e04edb06ba757d65989797')
sha256sums_armv7h=('8a1c1f61cf40c5d717db14f73b6f0ff1249ecde323e37d1409046b661fe7d1cf')
sha256sums_i686=('f6d1d142c8afa0c476c312c3bfc304017d6bf15ff2cf50fa9d685fa583559331')
sha256sums_x86_64=('d6b1aae1c2804f2f44fdd0308c2ea8d1a47f39675e0a29178834abaf910fcec5')
package() {
    install -Dm755 "${srcdir}/usr/bin/"* -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
