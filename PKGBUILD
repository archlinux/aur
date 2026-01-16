# Maintainer: Knotrocket <knotrocket12 at gmail dot com>

pkgname=arf-git
pkgver=r79.d3d4b95
pkgrel=1
pkgdesc="An experimental standalone fzf AUR helper"
arch=('any')
url="https://github.com/Samq64/arf"
license=('MIT')
depends=('bash' 'curl' 'fzf' 'git' 'jq' 'pacman' 'python' 'python-requests')
optdepends=('sudo: default privilege elevation')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'fzur-git')
source=('git+https://github.com/Samq64/arf.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm 755 arf.sh "$pkgdir/usr/bin/arf"
    install -Dm 755 pkg-preview.sh "$pkgdir/usr/lib/arf/pkg-preview.sh"
    install -Dm 755 diff-preview.sh "$pkgdir/usr/lib/arf/diff-preview.sh"
    install -Dm 755 resolve.py "$pkgdir/usr/lib/arf/resolve.py"
}
