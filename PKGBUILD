# Maintainer: Stefan Fürst <stefan20fuerst12@gmail.com>
pkgname=gns3util
pkgver=1.1.2
pkgrel=1
pkgdesc="GNS3 API utility for managing GNS3v3 servers"
arch=('x86_64' 'aarch64')
url="https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.1.1/gns3util-linux-amd64.tar.gz"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source_x86_64=("https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v${pkgver}/gns3util-linux-amd64.tar.gz")
source_aarch64=("https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v${pkgver}/gns3util-linux-arm64.tar.gz")
sha256sums_x86_64=("cbf662e5b237e4e3d90f89b336ac88bea4cbe221a62fea16b23ce840f126fe36")
sha256sums_aarch64=("1e4a8813a1d2725c74b94c88350e397b1e78ec07e619cc9cd885ab6b3cdcad78")

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
