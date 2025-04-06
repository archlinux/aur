pkgname=pcloudcc-lneely
pkgver=20250407T2152Z
pkgrel=2
epoch=0
pkgdesc="pcloudcc-lneely is a simple linux console client for pCloud cloud storage, forked from github.com/pcloudcom/console-client and independently maintained."
arch=('x86_64')
provides=("pcloudcc")
conflicts=("pcloudcc-git")
url="https://github.com/lneely/pcloudcc-lneely"
license=(BSD-3-Clause)
depends=(readline zlib fuse2 mbedtls sqlite boost)
makedepends=(udev)
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/lneely/pcloudcc-lneely/tar.gz/refs/tags/$pkgver")
sha256sums=('477534c748b7d17b03befaa9e25dedc952695bb19384bcf8854e18fb8c5a05e1')

build() {
    cd "pcloudcc-lneely-$pkgver"
    make
}

package() {
    cd "pcloudcc-lneely-$pkgver"
    install -d $pkgdir/usr/bin
    install -m 755 pcloudcc $pkgdir/usr/bin/pcloudcc
}


