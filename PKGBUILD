# Maintainer: ferk <ferkiwi @at gmail dot com>

pkgname=stest
pkgver=1.d88d470
pkgrel=1
pkgdesc="filter a file list by properties (replacement for dmenu stest)"
arch=('any')
url="http://github.com/Ferk/stest"
license=('MIT')
depends=()
makedepends=('git')
conflicts=('dmenu<=9')
provides=('stest')
source=("git+https://github.com/Ferk/stest.git")
md5sums=('SKIP')

_gitroot="stest"

pkgver () {
    cd "$srcdir/$_gitroot"
    echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
    cd "$srcdir/$_gitroot"
    make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir" install
}
