# Maintainer: libele <libele@disroot.org>
# Contributor: Schroedinger <1181822466 at qq dot com>
# Contributor: dacoit <dacoit at tuta.io>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>
# Contributor: Evan Gates <evan.gates at gmail dot com>
# Contributor: Vardyr <vardyr.al at insocada dot com>

pkgname=woof
pkgver=20220113
pkgrel=1
pkgdesc='An ad-hoc single file webserver; Web Offer One File'
arch=('any')
url="http://www.home.unix-ag.org/simon/$pkgname.html"
license=('GPL2')
depends=('python3')
makedepends=('git')
conflicts=()
source=("git+https://github.com/simon-budig/$pkgname")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
