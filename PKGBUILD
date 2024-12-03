# Maintainer: nilrem <nilremdev@gmail.com>
pkgname=sttt-git
pkgver=r29.ef96d8c
pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
pkgrel=1
pkgdesc='bezier-eased terminal animations'
arch=(any)
url="https://github.com/flick0/sttt"
license=('MIT')
provides=("sttt")
depends=('python3' 'ncurses')
makedepends=('git')
source=("sttt-git::git+https://github.com/flick0/sttt.git")
sha256sums=('SKIP')
package() {
    install -Dm 755 "$pkgname/sttt" "$pkgdir/usr/bin/sttt"
    install -Dm 644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
