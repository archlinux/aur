# Maintainer: Ehsan Ghorbannezad <ehsan at disroot dot org>
pkgname=pcal-calendar-git
pkgver=r12.94deca8
pkgrel=4
pkgdesc='CLI tool to convert Georgian dates to Persian dates'
arch=('any')
url='https://github.com/a5hk/pcal'
license=('MIT')
makedepends=('git')
source=("git+$url.git")
md5sums=('SKIP')
provides=('pcal-calendar')
conflicts=('pcal-calendar')

pkgver() {
    cd 'pcal'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd 'pcal'
    install -Dm755 pcal "$pkgdir/usr/bin/pcal"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
