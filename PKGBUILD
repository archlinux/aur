# Maintainer: rownix101 <rownix101@gmail.com>
pkgname=zigmir-bin
pkgver=0.0.2
pkgrel=1
pkgdesc="A blazing-fast Arch Linux mirror speed tester written in Zig"
arch=('x86_64' 'aarch64')
url="https://github.com/rownix101/zigmir"
license=('MIT')
provides=('zigmir')
conflicts=('zigmir')
source_x86_64=("${pkgname}-${pkgver}-${CARCH}::https://github.com/rownix101/zigmir/releases/download/v${pkgver}/zigmir-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-${CARCH}::https://github.com/rownix101/zigmir/releases/download/v${pkgver}/zigmir-linux-arm64")
sha256sums_x86_64=('fbe34b5d9324efe102617fd714c85278cf04e56d416bb62ab90bb5895360a59a')
sha256sums_aarch64=('2a240a942f3362648f5d8c4995d89db731ba4c4357f17373138e360ba1761d52')
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/zigmir"
    install -d "${pkgdir}/usr/share/bash-completion/completions"
    install -d "${pkgdir}/usr/share/zsh/site-functions"
    install -d "${pkgdir}/usr/share/fish/vendor_completions.d"
    "${srcdir}/${pkgname}-${pkgver}-${CARCH}" --completion bash > "${pkgdir}/usr/share/bash-completion/completions/zigmir"
    "${srcdir}/${pkgname}-${pkgver}-${CARCH}" --completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_zigmir"
    "${srcdir}/${pkgname}-${pkgver}-${CARCH}" --completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/zigmir.fish"
}
