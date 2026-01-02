# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname='neo-matrix'
_name='neo'
pkgver=0.6.1
pkgrel=3
pkgdesc='Simulates the digital rain from "The Matrix"'
arch=('x86_64')
url='https://github.com/st3w/neo'
license=('GPL-3.0-only')
depends=(
    'ncurses'
    'gcc-libs'
    'glibc'
)
makedepends=()
optdepends=('ttf-hanazono')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('744a88cc6b98a4625ae5c5ee819640561f3df87518be0f9fca00ad787814b200')

prepare() {
    cd "$_name-$pkgver"
    ./autogen.sh
}

build() {
    cd "$_name-$pkgver"
    ./configure --program-suffix='-matrix' --prefix="$pkgdir/usr"
    make
}

package() {
    cd "$_name-$pkgver"
    make install
}
