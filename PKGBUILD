# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Knut Ahlers <knut at ahlers dot me>

pkgname=librespeed-cli
_pkgname=speedtest-cli
pkgver=1.0.12
pkgrel=1
pkgdesc="Command line client for LibreSpeed"
arch=(i686 x86_64)
url="https://github.com/librespeed/speedtest-cli"
license=(LGPL-3.0-only)
makedepends=(git go)
depends=(glibc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2813ff49a8bc99687e70599212e05f0d995cd7f685e1202e80eea4ff58767301')

build() {
    cd "$_pkgname-$pkgver"
    bash build.sh
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm755 "out/$pkgname-$(go env GOOS)-$(go env GOARCH)" "$pkgdir/usr/bin/$pkgname"
}
