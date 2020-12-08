# Maintainer: JakobDev <jakobdev@gmx.de>
pkgname=ndstool
pkgver=2.1.2
pkgrel=1
pkgdesc="A tool for packing and unpacking nds roms"
arch=('any')
url="https://github.com/devkitPro/ndstool/"
license=("GPL3")
depends=()
makedepends=("gcc" "make")
source=("https://github.com/devkitPro/ndstool/releases/download/v$pkgver/ndstool-$pkgver.tar.bz2")
sha256sums=("4fb4668e52cb48fe54adff8241e09751a8ed6f38639978bfbf33236427ba7d09")

build() {
    cd "$srcdir/ndstool-$pkgver"
    chmod +x autogen.sh configure
    ./autogen.sh
    ./configure --prefix=$pkgdir/usr
    make
}

package() {
    cd "$srcdir/ndstool-$pkgver"
    make install
}
