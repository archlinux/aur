# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Saksham Gupta <sakshamdam54321 at gmail dot com>
pkgname=payload-dumper-go-bin
pkgver=2.0.1
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
sha256sums_aarch64=('3b8f9a457de4a98070041598ee18616ce6d498264fc9f3c27b06710feb31f681')
sha256sums_armv7h=('4f7c315b35b22db53a3d83ab44b0019c8c1bf09a7918a569ef71e22235603aaa')
sha256sums_x86_64=('ebca8aa8742ba50b6d6acea5172a31023adb57532fa96931fd71d980931f953d')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "$pkgdir/usr/bin"
    install -Dm644 "${srcdir}/README.md" -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
