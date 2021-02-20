# Maintainer: Tim Yang <protonmail = timdyang>

pkgname=tuxi-git
pkgver=r238.e88264d
pkgrel=1
pkgdesc="A CLI assistant which scrapes Google search to get instant answers to your questions on your terminal"
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
    install -Dm755 tuxi "$pkgdir"/usr/bin/tuxi
}
