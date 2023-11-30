# Maintainer: Danny Waser (Waser Technologies) <danny@waser.tech>

pkgname=fortune-mod-samantha
pkgver=1.0
pkgrel=1
pkgdesc="Quotes from samantha (and OS1) from the movie Her for the Unix fortune tool"
url="https://github.com/wasertech/fortune-samantha"
arch=('any')
license=('GPLv3')
depends=('fortune-mod')
groups=('fortune-mods')
source=("git+https://github.com/wasertech/fortune-samantha.git")
md5sums=(SKIP)

build() {
    cd fortune-samantha
    make clean && make
}

package () {
    cd fortune-samantha
    mkdir -p $pkgdir/usr/share/fortune
    install -D -m644 fortunes/* $pkgdir/usr/share/fortune
}