# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=go-blueprint-bin
pkgver=0.10.7
pkgrel=1
pkgdesc="Go-blueprint allows users to spin up a quick Go project using a popular framework.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://docs.go-blueprint.dev/"
_ghurl="https://github.com/Melkeydev/go-blueprint"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/Melkeydev/go-blueprint/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('8dbc61ccb9df6583bf6cd0ad23ca0a38e1eb0655f38eb85ec2b71b71392d5060')
sha256sums_aarch64=('89f2c6f8fb8f0fca66f1c8ee1cefb9189d95e77973c6e628196a95433776cadd')
sha256sums_x86_64=('fea7913fb8c0ec9adcda12fb3c62ecff02fa425f174ad3c54319b2953d054bea')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/completions/${pkgname%-bin}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
    install -Dm644 "${srcdir}/completions/${pkgname%-bin}.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm644 "${srcdir}/completions/${pkgname%-bin}.zsh" "$pkgdir/usr/share/zsh/site-functions/_${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
