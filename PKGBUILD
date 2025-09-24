# Maintainer: Stefan Fürst <stefan20fuerst12@gmail.com>
pkgname=gns3util
pkgver=1.2.4
pkgrel=1
pkgdesc="GNS3 API utility for managing GNS3v3 servers"
arch=('x86_64' 'aarch64')
url="https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v1.2.4/gns3util-linux-amd64.tar.gz"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source_x86_64=("https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v${pkgver}/gns3util-linux-amd64.tar.gz")
source_aarch64=("https://github.com/Stefanistkuhl/gns3-api-util/releases/download/v${pkgver}/gns3util-linux-arm64.tar.gz")
sha256sums_x86_64=("7453deba0a875c1b6ff2866b465ff6a310815c4474c26b6c585644f0d90a86ae")
sha256sums_aarch64=("9fb456b589784203612cb8056fca209eacc8c287f384cf57641206a810c651df")

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
