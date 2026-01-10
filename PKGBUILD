# Maintainer: Samuel Q. <massnel at proton dot me>

pkgname=fzur-git
pkgver=r71.2216e00
pkgrel=1
pkgdesc="A standalone fzf AUR helper"
arch=('any')
url="https://github.com/Samq64/fzur"
license=('MIT')
depends=('bash' 'curl' 'fzf' 'git' 'jq' 'pacman')
optdepends=('sudo: default privilege elevation')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Samq64/fzur.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm 755 fzur.sh "$pkgdir/usr/bin/fzur"
    install -Dm 755 pkg-preview.sh "$pkgdir/usr/lib/fzur/pkg-preview.sh"
    install -Dm 755 diff-preview.sh "$pkgdir/usr/lib/fzur/diff-preview.sh"
}
