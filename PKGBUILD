# Maintainer: Xiangpeng Hao <me@haoxp.xyz>

pkgname=pmdk-git
_gitname="pmdk"
pkgver=1.6.r49.g6e9868c93
pkgrel=1
epoch=
pkgdesc="Persistent Memory Development Kit."
arch=("x86_64")
url="http://pmem.io"
license=("Intel")
groups=()
depends=("autoconf" "pkgconf" "ndctl")
makedepends=("git")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git://github.com/pmem/pmdk.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
    cd "$_gitname"
    git checkout stable-1.6
}

pkgver() {
	cd "$_gitname"
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_gitname"
    make -j
}

package() {
    cd "$srcdir/$_gitname"
	make install DESTDIR="$pkgdir" 
}
