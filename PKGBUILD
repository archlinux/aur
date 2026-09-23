# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Saksham Gupta <sakshamdam54321 at gmail dot com>
pkgname=payload-dumper-go-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="An android OTA payload dumper written in Go."
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
sha256sums_aarch64=('5743a39b48d0c4dab948ad6e5d9ff275e649528e5dfd2b7db4b6893093b70f6c')
sha256sums_armv7h=('81109f54ad4d63c8d81e58bca6b430019b3bc4d692eb5c375996af5581a56f12')
sha256sums_x86_64=('bbbb53a71955c69272afdef7bc7e83a1bb1770f453d0c21dcaf61a3ba0463c11')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "$pkgdir/usr/bin"
    install -Dm644 "${srcdir}/README.md" -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
