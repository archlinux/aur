# Maintainer: Fabio Cosentino <fcosentino.dev@.com>

pkgname=aur-taw
pkgver=1.3.0
pkgrel=1
pkgdesc="A minimalist, RAM-safe, opt-in AUR helper written in pure bash"
arch=('any')
url="https://github.com/Costa-exe/aur-taw"
license=('MIT')
depends=('bash' 'git' 'curl' 'jq' 'gnupg' 'pacman' 'less' 'coreutils' 'util-linux' 'bubblewrap>=0.13' 'libarchive' 'sudo' 'fakeroot' 'gawk' 'grep' 'sed' 'diffutils')
optdepends=('bash-completion: completamento Bash' 'systemd' 'base-devel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6167f94fc93f401e27163f875ef705487816aa8890e31e3eac6a74d98afbb352')

package() {
    cd "${srcdir}/aur-taw-1.3.0"

    install -Dm755 aur-taw "${pkgdir}/usr/bin/aur-taw"

    install -Dm644 aur-taw-completion.bash "${pkgdir}/usr/share/bash-completion/completions/aur-taw"

    install -d "${pkgdir}/usr/share/aur-taw/lib"
    install -m644 lib/*.bash "${pkgdir}/usr/share/aur-taw/lib/"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
