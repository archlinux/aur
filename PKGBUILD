pkgname=pcloudcc-lneely
pkgver=20260301T0815Z
pkgrel=1
epoch=0
pkgdesc="pcloudcc-lneely is a simple linux console client for pCloud cloud storage, forked from github.com/pcloudcom/console-client and independently maintained."
arch=('x86_64' 'aarch64')
provides=("pcloudcc")
conflicts=("pcloudcc-git")
url="https://github.com/lneely/pcloudcc-lneely"
license=(BSD-3-Clause)
depends=(readline zlib fuse2 mbedtls sqlite boost)
makedepends=(udev)
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/lneely/pcloudcc-lneely/tar.gz/refs/tags/$pkgver")
sha256sums=('23334694c84f8b05f7a0b6b379a7af19ddc6a7e8e5b44af2f3759956be42385a')

build() {
    cd "pcloudcc-lneely-$pkgver"
    make
}

package() {
    cd "pcloudcc-lneely-$pkgver"
    install -d $pkgdir/usr/bin
    install -m 755 pcloudcc $pkgdir/usr/bin/pcloudcc
}


