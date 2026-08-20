# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Saksham Gupta <sakshamdam54321 at gmail dot com>
pkgname=payload-dumper-go-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="an android OTA payload dumper written in Go.(Prebuilt version)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://github.com/ssut/payload-dumper-go"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}=${pkgver}")
depends=()
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv7.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('161da9bcd7993a483f58574fcb466fa24b91504876bf50747aabfcb9a4171645')
sha256sums_armv7h=('2cdbf77a477692215e5b0ebb4b1f9923c4ce28a9855fcb781a7dc245ea7d01e7')
sha256sums_x86_64=('8d81854caeacd9223a6882340959869b0a210d44a1e597329830713abd2b4dcc')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "$pkgdir/usr/bin"
    install -Dm644 "${srcdir}/README.md" -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
