# Maintainer: Vladimir Krivopalov <vladimir.krivopalov@gmail.com>
pkgname=antlr3-cpp-headers-git
pkgver=r572.5c2a916
pkgrel=1
pkgdesc="C++ headers for Antlr3 runtime"
arch=('any')
url="http://www.antlr3.org/"
license=('BSD')
depends=('antlr3' 'libantlr3c')
provides=('antlr3-cpp-headers')
conflicts=('antlr3-cpp-headers')
source=('antlr3-git::git+https://github.com/antlr/antlr3.git')
md5sums=('SKIP')

pkgver() {
	cd $srcdir/antlr3-git
    # Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    chmod 0644 ${srcdir}/antlr3-git/runtime/Cpp/include/*
    mkdir -p  $pkgdir/usr
    cp -r ${srcdir}/antlr3-git/runtime/Cpp/include/ ${pkgdir}/usr/
}
