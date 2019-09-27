# Maintainer: ache <ache@ache.one>

pkgname=mesms-git
pkgver=20190918
pkgrel=1
pkgdesc="A ncurses based SMS manager"
arch=("any")
url="https://git.ache.one/mesms"
license=('GPL3')
makedepends=('git' 'readline' 'ncurses')
optdepends=('gammu')
provides=("mesms")
source=("mesms::git+https://git.ache.one/mesms")

md5sums=('SKIP')

pkgver() {
    cd "$srcdir/mesms"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
    cd "$srcdir/mesms"
    make
}

package() {
    cd "$srcdir/mesms"
    install -Dm755 "mesms" "$pkgdir/usr/bin/mesms"
}

