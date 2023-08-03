# Maintainer: Vlad Vasiliu <vladvasiliun@yahoo.fr>
pkgname=copilot-cli-bin
pkgver=1.29.1
pkgrel=1
pkgdesc='Your toolkit for containerized applications on AWS.'
arch=('aarch64' 'x86_64')
url='https://aws.github.io/copilot-cli/'
license=('Apache')
provides=()
makedepends=()
depends=()
conflicts=('copilot-cli')
source_x86_64=("copilot-${pkgver}-x86_64::https://github.com/aws/copilot-cli/releases/download/v${pkgver}/copilot-linux-amd64-v${pkgver}")
source_aarch64=("copilot-${pkgver}-aarch64::https://github.com/aws/copilot-cli/releases/download/v${pkgver}/copilot-linux-arm64-v${pkgver}")
md5sums_x86_64=('8cd325357e7cb75e37b16c74606b8502')
md5sums_aarch64=('f6f68d5aa2ee09d5a30038b67a0f22a6')
noextract=("copilot-${pkgver}")

package() {
    install -Dm 755 ${srcdir}/copilot-${pkgver}-${CARCH} ${pkgdir}/usr/bin/copilot

    install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
    "$pkgdir/usr/bin/copilot" completion bash > "$pkgdir/usr/share/bash-completion/completions/copilot"
    "$pkgdir/usr/bin/copilot" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_copilot"
}

