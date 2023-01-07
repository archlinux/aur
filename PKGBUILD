# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>
# Contributor: Damien Flament <damien.flament at gmx dot com>

pkgname='shellspec'
pkgver=0.28.1
pkgrel=2
pkgdesc="BDD style unit testing framework for POSIX compliant shell script"
url="https://shellspec.info"
license=('MIT')
arch=('any')
depends=('sh')
makedepends=('git')
source=("shellspec::git+https://github.com/shellspec/shellspec.git#tag=$pkgver")
sha256sums=('SKIP')

check() {
    cd "shellspec" || return

    make test
}

package() {
    cd "shellspec" || return

    PREFIX="$pkgdir/usr" make install
    install -m 644 -Dt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
