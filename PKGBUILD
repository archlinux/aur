pkgname=pcloudcc-lneely
pkgver=20260214T1908Z
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
sha256sums=('db6f3c5fb1db8d7ee00ba097b2dfba96ddfbd93b61fecde6db6a40d73dbb505d')

build() {
    cd "pcloudcc-lneely-$pkgver"
    make
}

package() {
    cd "pcloudcc-lneely-$pkgver"
    install -d $pkgdir/usr/bin
    install -m 755 pcloudcc $pkgdir/usr/bin/pcloudcc
}


