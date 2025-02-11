# Maintainer: Pol Rivero <aur at polrivero dot com>
pkgname=doot-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="A fast and simple dotfiles manager that just gets the job done (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/pol-rivero/doot"
license=('MIT')
provides=('doot')
conflicts=('doot')

depends=('git' 'git-crypt')
optdepends=('diffutils: To display changes before overwriting a file')

source_x86_64=("https://github.com/pol-rivero/doot/releases/download/0.0.5/doot-linux-x86_64")
sha256sums_x86_64=('1f7f4792b909674ccb84e222e07579493f3df19ffb1afb52dcb0c43ee0b3b70a')
source_aarch64=("https://github.com/pol-rivero/doot/releases/download/0.0.5/doot-linux-arm64")
sha256sums_aarch64=('b12d03f547706dc71c94fff2905cabe0d20f4d04846a0e2c83fac6badf996244')

package() {
    if [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "doot-linux-arm64" "$pkgdir/usr/bin/doot"
    else
        install -Dm755 "doot-linux-x86_64" "$pkgdir/usr/bin/doot"
    fi
}
