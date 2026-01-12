# Maintainer: Jakub Królak <108676707+j-krolak@users.noreply.github.com>
pkgname='kabi-git'
pkgver=r14.f09fe99
pkgrel=1
pkgdesc="A hint-base file explorer written in bash"
arch=('any')
url="https://github.com/j-krolak/kabi"
license=('MIT')
depends=(
    'bash'
    'coreutils'
    'grep'
    'file'
    'fzf'
    'ncurses'
    'findutils'
    'awk'
)
makedepends=('git')
optdepends=(
    'xdg-utils: to open files with their default applications'
)
source=("${pkgname%-git}::git+https://github.com/j-krolak/kabi")
sha256sums=('SKIP')

pkgver() {
    cd kabi
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd kabi
    install -Dm755 kabi "$pkgdir/usr/bin/kabi"

		install -d "$pkgdir/usr/lib/kabi"
		install -m644 include/* "$pkgdir/usr/lib/kabi/"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
