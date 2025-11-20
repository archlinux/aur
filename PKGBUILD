# Maintainer: Eleanor Kelley <me at eleanorkelley dot com>

_pkgname=monerod-block.txt
pkgname=$_pkgname-git
pkgver=r2.8c4c9a5
pkgrel=1
pkgdesc="Popular block.txt for monerod"
arch=(any)
url="https://github.com/eleanor-k/block.txt"
license=('BSD-3-Clause')
depends=('monero')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
b2sums=('SKIP')
install=$pkgname.install

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"

}

package() {
    install -Dm644 $_pkgname/block.txt "$pkgdir"/usr/share/monero/block.txt
}

