# Maintainer: Equationzhao <equationzhao at foxmail dot com>
pkgname='goddns'
pkgver=0.1.8
pkgrel=1
pkgdesc='A dynamic DNS client written in golang'
arch=($CARCH)
url='https://github.com/Equationzhao/GodDns'
license=('MIT')
makedepends=('go')
backup=("etc/$pkgname/config.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8a57489ce99330abbd1424c9f25b2681fd58345c2fd1792262323c7da1d55773')

build() {
    cd "$srcdir/GodDns-$pkgver"
    make build
    mv ./build/GodDns .
}

package() {
    cd "$srcdir/GodDns-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    install -m=775 GodDns "${pkgdir}/usr/bin"
}