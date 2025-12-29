# Maintainer: Samuel Q. <massnel at proton dot me>

pkgname=fzur-git
pkgver=r61.aa67925
pkgrel=1
pkgdesc="A standalone fzf AUR helper"
arch=('any')
url="https://github.com/Samq64/fzur"
license=('MIT')
depends=('curl' 'fzf' 'git' 'jq' 'sudo')
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
    install -Dm 755 fzur "$pkgdir/usr/bin/fzur"
    install -Dm 755 fzur-info "$pkgdir/usr/bin/fzur-info"
}
