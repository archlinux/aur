# Maintainer: Xiangpeng Hao <me@haoxp.xyz>

pkgname=pmdk-git
_gitname="pmdk"
pkgver=1.8.r910.g6c7e703d2
pkgrel=1
pkgdesc="Persistent Memory Development Kit."
arch=("x86_64")
url="http://pmem.io"
license=(BSD)
depends=("python" "ndctl")
makedepends=("git" "pandoc" "autoconf" "pkgconf" "man-db")
source=("git://github.com/pmem/pmdk.git")
noextract=()
md5sums=('SKIP')

prepare() {
    echo "prepare()"
}

pkgver() {
	cd "$srcdir/$_gitname"
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_gitname"
    make -j
}

package() {
    cd "$srcdir/$_gitname"
    make install DESTDIR="$pkgdir" 
    echo $pkgdir
}
