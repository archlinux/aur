# Maintainer: Nathan Monfils <nathan.monfils@hotmail.fr>

pkgname=fortune-mod-portal-game
pkgver=1.0
pkgrel=2
pkgdesc="Portal quotes for the Unix fortune tool"
url="https://github.com/outadoc/portal-fortunes"
arch=('any')
license=('unknown')
depends=('fortune-mod')
conflicts=('fortune-mod-portal')
groups=('fortune-mods')
source=("git+https://github.com/outadoc/portal-fortunes.git")
md5sums=(SKIP)

build() {
    cd portal-fortunes
    make clean && make
}

package () {
    cd portal-fortunes
    mkdir -p $pkgdir/usr/share/fortune
    install -D -m644 fortunes/* $pkgdir/usr/share/fortune
}
