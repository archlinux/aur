# Maintainer: Fabio Cosentino <fcosentino.dev@.com>

pkgname=aur-taw
pkgver=1.2.0
pkgrel=4
pkgdesc="A minimalist, RAM-safe, opt-in AUR helper written in pure bash"
arch=('any')
url="https://github.com/Costa-exe/aur-taw"
license=('MIT')
depends=('bash' 'git' 'curl' 'jq' 'pacman-contrib' 'less')
optdepends=('bash-completion')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d346af40d7a4cd5de7a2e93432c3e5762ddf9792e7b0cf96526d550ebabeea41')

package() {
    cd "${srcdir}/${pkgname}-${pkgver#v}" || cd "${srcdir}"
    
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/bash-completion/completions"
    install -d "${pkgdir}/usr/share/aur-taw/lib"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"

    install -m755 aur-taw "${pkgdir}/usr/bin/aur-taw"
    install -m644 aur-taw-completion.bash "${pkgdir}/usr/share/bash-completion/completions/aur-taw"
    install -m644 lib/*.bash "${pkgdir}/usr/share/aur-taw/lib/"
    install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
