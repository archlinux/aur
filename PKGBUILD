pkgname=pcloudcc-lneely
pkgver=20240815T0919Z
pkgrel=1
epoch=0
pkgdesc="pcloudcc-lneely is a simple linux console client for pCloud cloud storage, forked from github.com/pcloudcom/console-client and independently maintained."
arch=('x86_64')
url="https://github.com/lneely/pcloudcc-lneely"
license=(BSD-3-Clause)
makedepends=(cmake)
depends=(zlib boost fuse2)

source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/lneely/pcloudcc-lneely/tar.gz/refs/tags/$pkgver")
sha256sums=('1d80090605ffff5db1e1db088b521503c442a3f80f6af4ed3c1b8aaf4a796163')

build() {
    cd "pcloudcc-lneely-$pkgver"
    make
}

package() {
    cd "pcloudcc-lneely-$pkgver"
    install -d $pkgdir/usr/{bin,lib}
    install -m 755 cmd/pcloudcc/build/pcloudcc $pkgdir/usr/bin/pcloudcc
    install -m 755 cmd/pcloudcc/build/libpcloudcc_lib.so $pkgdir/usr/lib/libpcloudcc_lib.so
}


