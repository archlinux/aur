# Maintainer: czyt <czytcn@gmail.com>
pkgname=fizzy-cli-bin
pkgver=4.1.0
pkgrel=1
pkgdesc="CLI for managing Fizzy boards, cards, comments, and tasks"
arch=('x86_64' 'aarch64')
url="https://github.com/basecamp/fizzy-cli"
license=('MIT')
options=('!debug')
depends=('ca-certificates')
provides=('fizzy-cli' 'fizzy')
conflicts=('fizzy-cli' 'fizzy' 'fizzy-bin')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/basecamp/fizzy-cli/releases/download/v${pkgver}/fizzy_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/basecamp/fizzy-cli/releases/download/v${pkgver}/fizzy_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('88ce566a043ed9049b69ba2e854453031e0684382907138dc329bd03cf990d50')
sha256sums_aarch64=('2cbd4d818c1527a81ec57d9db08d8eba5ea090aa8eacbe7d8ad80d3fa4bf6aa8')

package() {
    install -Dm755 "${srcdir}/fizzy" "${pkgdir}/usr/bin/fizzy"
    install -Dm644 "${srcdir}/completions/fizzy.bash" "${pkgdir}/usr/share/bash-completion/completions/fizzy"
    install -Dm644 "${srcdir}/completions/fizzy.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/fizzy.fish"
    install -Dm644 "${srcdir}/completions/fizzy.zsh" "${pkgdir}/usr/share/zsh/site-functions/_fizzy"
    install -Dm644 "${srcdir}/MIT-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/MIT-LICENSE"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
