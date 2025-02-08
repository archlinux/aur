# Maintainer: Pol Rivero <aur at polrivero dot com>
pkgname=doot-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="A fast and simple dotfiles manager that just gets the job done (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/pol-rivero/doot"
license=('MIT')
provides=('doot')
conflicts=('doot')

depends=('git' 'git-crypt')
optdepends=('diff: To display changes before overwriting a file')

source_x86_64=("https://github.com/pol-rivero/doot/releases/download/pre.2025.02.07.1842/doot-linux-x86_64")
sha256sums_x86_64=('25fc5b23ddc96d2758b863f59c8393900640222d8bd07b4ec9b7d9fccc340949')
source_aarch64=("https://github.com/pol-rivero/doot/releases/download/pre.2025.02.07.1842/doot-linux-arm64")
sha256sums_aarch64=('0501dc24ccc2ac4b3ae162b363242a4606cba8945508ca45a5f1132b1d1c597c')

package() {
    if [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "doot-linux-arm64" "$pkgdir/usr/bin/doot"
    else
        install -Dm755 "doot-linux-x86_64" "$pkgdir/usr/bin/doot"
    fi
}
