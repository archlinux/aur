# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Saksham Gupta <sakshamdam54321 at gmail dot com>
pkgname=payload-dumper-go-bin
pkgver=2.0.0
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
sha256sums_aarch64=('db821807cea805605c8d3af6be3428bbe293d02e5129e30c2fa5cf4f33d7c6d3')
sha256sums_armv7h=('ce9b04eb2d1baca3315951d2c70d7aa71bd4db7180b7a0e5b8dd897aab6afb0a')
sha256sums_x86_64=('ac3f27435e0c88d4b552f343765f78fa44b552e4cd9892ff492fff929a1c4e6e')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "$pkgdir/usr/bin"
    install -Dm644 "${srcdir}/README.md" -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}