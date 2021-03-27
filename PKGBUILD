# Maintainer: Tim Yang <protonmail = timdyang>

pkgname=tuxi-git
pkgver=r320.2b7ef7d
pkgrel=1
pkgdesc="A CLI tool that scrapes Google search results and SERPs to provide instant and concise answers"
arch=(any)
url=https://github.com/Bugswriter/tuxi
license=(GPL3)
depends=(jq pup recode)
makedepends=(git)
provides=(tuxi)
conflicts=(tuxi)
source=($pkgname::git+https://github.com/Bugswriter/tuxi)
md5sums=(SKIP)

pkgver() {
    cd "$srcdir"/$pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir"/$pkgname
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
