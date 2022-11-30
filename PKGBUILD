# Maintainer: Vlad Vasiliu <vladvasiliun@yahoo.fr>
pkgname=copilot-cli-bin
pkgver=1.24.0
pkgrel=1
pkgdesc='Your toolkit for containerized applications on AWS.'
arch=('aarch64' 'x86_64')
url='https://aws.github.io/copilot-cli/'
license=('Apache')
provides=()
makedepends=()
depends=()
conflicts=('copilot-cli')
source_x86_64=("copilot-${pkgver}::https://github.com/aws/copilot-cli/releases/download/v${pkgver}/copilot-linux-amd64-v${pkgver}")
source_aarch64=("copilot-${pkgver}::https://github.com/aws/copilot-cli/releases/download/v${pkgver}/copilot-linux-arm64-v${pkgver}")
md5sums_x86_64=('22f3e49351c04309a0af13eaf969cbc3')
md5sums_aarch64=('a72c14cbb989d7a9937d5b4d22795e51')
noextract=("copilot-${pkgver}")

package() {
    install -Dm 755 ${srcdir}/copilot-${pkgver} ${pkgdir}/usr/bin/copilot

    install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
    "$pkgdir/usr/bin/copilot" completion bash > "$pkgdir/usr/share/bash-completion/completions/copilot"
    "$pkgdir/usr/bin/copilot" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_copilot"
}

