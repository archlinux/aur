# Maintainer: Corwin <corwin@kuiper.dev>
pkgname=gba-tools
pkgver=1.2.0
pkgrel=1
pkgdesc="Collection of tools for Game Boy Advance development"
url="https://github.com/devkitPro/gba-tools"
license=("GPL3")
arch=("all")
source=("https://github.com/devkitPro/gba-tools/archive/v$pkgver.tar.gz")
sha256sums=('1249fad1da0bc02ba33701357b28768cb8e9e00498a715753b95f00257490c32')

build() {
    cd $pkgname-$pkgver
    aclocal
    autoconf
    automake --add-missing -c
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir/" install
}