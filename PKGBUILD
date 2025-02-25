# Maintainer: JakobDev <jakobdev@gmx.de>
pkgname=ndstool
pkgver=2.3.1
pkgrel=1
pkgdesc="A tool for packing and unpacking nds roms"
arch=('any')
url="https://github.com/devkitPro/ndstool/"
license=("GPL3")
depends=()
makedepends=("gcc" "make")
source=("https://github.com/devkitPro/ndstool/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("5918dd3462d141bccba2412c06309bd7bca45a891067d455e97fdb8c9c1dd790")

build() {
    cd "$srcdir/ndstool-$pkgver"
    chmod +x autogen.sh
    ./autogen.sh
    ./configure --prefix=$pkgdir/usr
    make
}

package() {
    cd "$srcdir/ndstool-$pkgver"
    make install
    install -Dm644 "COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
