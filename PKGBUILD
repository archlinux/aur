# Maintainer: Pol Rivero <aur at polrivero dot com>
pkgname=doot-bin
pkgver=0.0.6
pkgrel=1
pkgdesc="A fast and simple dotfiles manager that just gets the job done (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/pol-rivero/doot"
license=('MIT')
provides=('doot')
conflicts=('doot')

depends=('git' 'git-crypt')
optdepends=('diffutils: To display changes before overwriting a file')

source_x86_64=("https://github.com/pol-rivero/doot/releases/download/0.0.6/doot-linux-x86_64")
sha256sums_x86_64=('e2fbe6aa1e6b9e4cd2a07c165c68de099687acd1ab4124551c093296ba27c4ee')
source_aarch64=("https://github.com/pol-rivero/doot/releases/download/0.0.6/doot-linux-arm64")
sha256sums_aarch64=('e07a96f20c433b6ef0628e3ff2387f67a159ca76fc2baa1b4f3a9589a1d39e67')

package() {
    if [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "doot-linux-arm64" "$pkgdir/usr/bin/doot"
    else
        install -Dm755 "doot-linux-x86_64" "$pkgdir/usr/bin/doot"
    fi
}
