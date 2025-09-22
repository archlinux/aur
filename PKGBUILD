# Maintainer: Stefan Fürst <stefan20fuerst12@gmail.com>
pkgname=gns3util
pkgver=1.1.1
pkgrel=1
pkgdesc="GNS3 API utility for managing GNS3v3 servers"
arch=('x86_64' 'aarch64')
url="https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.1.1/gns3util-linux-amd64.tar.gz"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source_x86_64=("https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v${pkgver}/gns3util-linux-amd64.tar.gz")
source_aarch64=("https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v${pkgver}/gns3util-linux-arm64.tar.gz")
sha256sums_x86_64=("b889a1e5b32aab8c276d8347ab938ba87b8c23bfd0f7c925872c059201178fc4")
sha256sums_aarch64=("35d86d81e223d1734654226f6e9553114f1850f55e6b180e56023aa1ee5c13dd")

package() {
    if [ -f "gns3util-linux-amd64" ]; then
        install -Dm755 gns3util-linux-amd64 "${pkgdir}/usr/bin/gns3util"
    elif [ -f "gns3util-linux-arm64" ]; then
        install -Dm755 gns3util-linux-arm64 "${pkgdir}/usr/bin/gns3util"
    fi
    
    # Install shell completions
    # if [ -d "completions" ]; then
    #     # Bash completion
    #     if [ -f "completions/gns3util.bash" ]; then
    #         install -Dm644 completions/gns3util.bash "${pkgdir}/usr/share/bash-completion/completions/gns3util"
    #     fi
    #     
    #     # Zsh completion
    #     if [ -f "completions/_gns3util" ]; then
    #         install -Dm644 completions/_gns3util "${pkgdir}/usr/share/zsh/site-functions/_gns3util"
    #     fi
    #     
    #     # Fish completion
    #     if [ -f "completions/gns3util.fish" ]; then
    #         install -Dm644 completions/gns3util.fish "${pkgdir}/usr/share/fish/vendor_completions.d/gns3util.fish"
    #     fi
    # fi
    
    if [ -f "man/gns3util.1" ]; then
        install -Dm644 man/gns3util.1 -t "${pkgdir}/usr/share/man/man1"
    fi
    
    if [ -f "LICENSE" ]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
