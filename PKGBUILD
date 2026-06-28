# Maintainer: Fabio Cosentino <fcosentino.dev@.com>

pkgname=aur-taw
pkgver=1.2.1
pkgrel=1
pkgdesc="A minimalist, RAM-safe, opt-in AUR helper written in pure bash"
arch=('any')
url="https://github.com/Costa-exe/aur-taw"
license=('MIT')
depends=('bash' 'git' 'curl' 'jq' 'pacman-contrib' 'less')
optdepends=('bash-completion')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('465b1d14c5efda07774312896d9aec2bb07a7f05b6c7aa0fb257139e6f1660ca')

package() {
    cd "${srcdir}/aur-taw-1.2.1"

    install -Dm755 aur-taw "${pkgdir}/usr/bin/aur-taw"

    install -Dm644 aur-taw-completion.bash "${pkgdir}/usr/share/bash-completion/completions/aur-taw"
    
    install -d "${pkgdir}/usr/share/aur-taw/lib"
    install -m644 lib/*.bash "${pkgdir}/usr/share/aur-taw/lib/"
    
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
