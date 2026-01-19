# Maintainer: Knotrocket <knotrocket12 at gmail dot com>

_pkgname=arf
pkgname="${_pkgname}-git"
pkgver=r80.2608469
pkgrel=1
pkgdesc="An experimental standalone fzf AUR helper"
arch=('any')
url="https://github.com/Samq64/arf"
license=('MIT')
depends=('bash' 'curl' 'fzf' 'git' 'jq' 'pacman' 'python' 'python-requests')
optdepends=('sudo: default privilege elevation')
provides=("$_pkgname")
conflicts=("$_pkgname" 'fzur-git')
source=('git+https://github.com/Samq64/arf.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm 755 arf.sh "$pkgdir/usr/bin/$_pkgname"
    install -Dm 755 pkg-preview.sh "$pkgdir/usr/lib/$_pkgname/pkg-preview.sh"
    install -Dm 755 diff-preview.sh "$pkgdir/usr/lib/$_pkgname/diff-preview.sh"
    install -Dm 755 resolve.py "$pkgdir/usr/lib/$_pkgname/resolve.py"
}
