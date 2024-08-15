pkgname=pcloudcc-lneely
pkgver=20240815T2111Z
pkgrel=1
epoch=0
pkgdesc="pcloudcc-lneely is a simple linux console client for pCloud cloud storage, forked from github.com/pcloudcom/console-client and independently maintained."
arch=('x86_64')
url="https://github.com/lneely/pcloudcc-lneely"
license=(BSD-3-Clause)
depends=(zlib boost fuse2 mbedtls2 udev sqlite)

source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/lneely/pcloudcc-lneely/tar.gz/refs/tags/$pkgver")
sha256sums=('d8a519fa93519d86738ff8c18c1e21b5156a8a6e52a667e4a7a936179818a9b9')

build() {
    cd "pcloudcc-lneely-$pkgver"
    make
}

package() {
    cd "pcloudcc-lneely-$pkgver"
    install -d $pkgdir/usr/{bin,lib}
    install -m 755 pcloudcc $pkgdir/usr/bin/pcloudcc
    install -m 755 libpcloudcc_lib.so $pkgdir/usr/lib/libpcloudcc_lib.so
}


