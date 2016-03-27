# Maintainer Denis Demidov <dennis.demidov@gmail.com>
pkgname=oclgrind-git
pkgver=20160327
pkgrel=2
pkgdesc="A SPIR interpreter and virtual OpenCL device simulator."
arch=("any")
url="https://github.com/jrprice/Oclgrind"
depends=("clang" "llvm")
license=("BSD")

source=("https://github.com/jrprice/Oclgrind/archive/master.zip")

md5sums=("SKIP")

pkgver() {
    date +%Y%m%d
}

build() {
    cd "${srcdir}/Oclgrind-master"

    autoreconf -i
    ./configure --prefix=${pkgdir}/usr
    make
}

package() {
    cd "${srcdir}/Oclgrind-master"
    make install
}

