# Maintainer: Pol Rivero <aur at polrivero dot com>
pkgname=doot-bin
pkgver=0.0.4
pkgrel=1
pkgdesc="A fast and simple dotfiles manager that just gets the job done (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/pol-rivero/doot"
license=('MIT')
provides=('doot')
conflicts=('doot')

depends=('git' 'git-crypt')
optdepends=('diffutils: To display changes before overwriting a file')

source_x86_64=("https://github.com/pol-rivero/doot/releases/download/0.0.4/doot-linux-x86_64")
sha256sums_x86_64=('e72b97f69938d22f53c068dda38b009c8c2196be0d3651745533065f2dd40cfd')
source_aarch64=("https://github.com/pol-rivero/doot/releases/download/0.0.4/doot-linux-arm64")
sha256sums_aarch64=('500d291915528684d851da8a88573534ad3642f309896ae64987cb02bf93a09d')

package() {
    if [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "doot-linux-arm64" "$pkgdir/usr/bin/doot"
    else
        install -Dm755 "doot-linux-x86_64" "$pkgdir/usr/bin/doot"
    fi
}
