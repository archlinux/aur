# Maintainer: agony <27015 at riseup dot net>

pkgname=mp4ff-bin
pkgver=0.63.0
pkgrel=1
pkgdesc='Tools for parsing and manipulating MP4/ISOBMFF files (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/Eyevinn/mp4ff'
license=('MIT')
provides=("mp4ff=${pkgver}")
conflicts=('mp4ff')
_release="${url}/releases/download/v${pkgver}"
source=("mp4ff_${pkgver}_bits_LICENSE.md::https://raw.githubusercontent.com/Eyevinn/mp4ff/v${pkgver}/bits/LICENSE.md"
        "mp4ff_${pkgver}_mp4_LICENSE.md::https://raw.githubusercontent.com/Eyevinn/mp4ff/v${pkgver}/mp4/LICENSE.md")
source_x86_64=("${_release}/mp4ff_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_release}/mp4ff_${pkgver}_linux_arm64.tar.gz")
sha256sums=('844a3d32d3e73b5b6d8c1eb29db0f577192fad5ca8492c9afe7b5d093b1fd429'
            '39a8b5a93eb3838e6e07626db26503ac740d339cea3a4650a838331ddb7f181a')
sha256sums_x86_64=('36762d0011168c687b086e9175e3765417e0c8dc8259b983d9a5bffef3db0b80')
sha256sums_aarch64=('1a26e6d919ae6fb64743f693321f360c6f1e3bcdc669d4ffea06d3149f05ef7a')

package() {
  install -Dm755 mp4ff-* -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "mp4ff_${pkgver}_bits_LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/bits/LICENSE.md"
  install -Dm644 "mp4ff_${pkgver}_mp4_LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/mp4/LICENSE.md"
}
