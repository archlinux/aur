# Maintainer: NotSludgeBomb <notsludgebomb@protonmail.com>
pkgname=gwatcher
pkgver=1.0.0
pkgrel=1
pkgdesc="watch for changes in dconf settings"
arch=('x86_64')
url="https://codeberg.org/NotSludgeBomb/gwatcher"
license=('GPL3')
depends=('glib2')
makedepends=('git' 'cargo')
source=("https://codeberg.org/NotSludgeBomb/gwatcher/archive/v${pkgver}.tar.gz")
sha256sums=('df338804414b983339615756708ab46169bfe3eab7271c4c626182a93cd5ad19')
build() {
    cd $srcdir/gwatcher
    make build
}
package() {
    cd $srcdir/gwatcher
    make DESTDIR=$pkgdir PREFIX=/usr install
}
