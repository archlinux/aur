pkgname=pcloudcc-lneely
pkgver=20240820T2027Z
pkgrel=1
epoch=0
pkgdesc="pcloudcc-lneely is a simple linux console client for pCloud cloud storage, forked from github.com/pcloudcom/console-client and independently maintained."
arch=('x86_64')
url="https://github.com/lneely/pcloudcc-lneely"
license=(BSD-3-Clause)
depends=(zlib boost fuse2 mbedtls2 udev sqlite)

source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/lneely/pcloudcc-lneely/tar.gz/refs/tags/$pkgver")
sha256sums=('730ea8900d22ed16ea2429270d4d1685196392cf34c882b463f426a493869a3e')

build() {
    cd "pcloudcc-lneely-$pkgver"
    make
}

package() {
    cd "pcloudcc-lneely-$pkgver"
    install -d $pkgdir/usr/bin
    install -m 755 pcloudcc $pkgdir/usr/bin/pcloudcc
}


