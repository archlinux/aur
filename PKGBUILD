# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=go-blueprint-bin
pkgver=0.10.8
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
sha256sums_aarch64=('68ce9767c1745fbcfe3788da990ff391b10eab77111397d11d5d5b28c0b752cd')
sha256sums_x86_64=('7b392d57c5f091c3dd2500a4c4e328cf384f70b48f5ec906bd2dd434439d0430')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/completions/${pkgname%-bin}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
    install -Dm644 "${srcdir}/completions/${pkgname%-bin}.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm644 "${srcdir}/completions/${pkgname%-bin}.zsh" "$pkgdir/usr/share/zsh/site-functions/_${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
