# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Knut Ahlers <knut at ahlers dot me>

pkgname=librespeed-cli
_pkgname=speedtest-cli
pkgver=1.0.10
pkgrel=2
pkgdesc="Command line client for LibreSpeed"
arch=(i686 x86_64)
url="https://github.com/librespeed/speedtest-cli"
license=(LGPL3)
makedepends=(git go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('904ec84f41714d5a7ab778534d332219cd254fdd0f97cc33ebb3540d31fb802c')

build() {
    cd "$_pkgname-$pkgver"
    bash build.sh
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm755 "out/$pkgname-$(go env GOOS)-$(go env GOARCH)" "$pkgdir/usr/bin/$pkgname"
}
