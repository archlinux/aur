# Maintainer: nilrem <nilremdev@gmail.com>
pkgname=sttt-git
pkgver=r29.ef96d8c
pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
pkgrel=3
pkgdesc='bezier-eased terminal animations'
arch=(any)
url="https://github.com/flickowoa/sttt"
license=('MIT')
provides=("sttt")
depends=('python3' 'ncurses')
makedepends=('git')
source=("sttt-git::git+${url}.git")
sha256sums=('SKIP')
package() {
    install -Dm 755 "$pkgname/sttt" "$pkgdir/usr/bin/sttt"
    install -Dm 644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
