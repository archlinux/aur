# Maintainer: NotSludgeBomb <notsludgebomb@protonmail.com>
pkgname=gwatcher
pkgver=1.0.1
pkgrel=1
pkgdesc="watch for changes in dconf settings"
arch=('x86_64')
url="https://codeberg.org/NotSludgeBomb/gwatcher"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo' 'pandoc')
source=("https://codeberg.org/NotSludgeBomb/gwatcher/archive/v${pkgver}.tar.gz")
sha256sums=('3121538f86ddded83b00bd7dad77e0fd45d13722527e8345ac10fb4889ab5c78')
build() {
    cd $srcdir/gwatcher
    make build
}
package() {
    cd $srcdir/gwatcher
    make DESTDIR=$pkgdir PREFIX=/usr install
}
