# Maintainer: Gabriel M. Dutra <0xdutra@gmail.com>

pkgname=ipinfo
pkgver=2.2.0
pkgrel=1
pkgdesc="ipinfo allowing you to lookup IP deltails, ASN, IP geolocation"
arch=('any')
_vendor="github.com/ipinfo/cli"
url="https://${_vendor}"
license=('APACHE20')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ipinfo/cli/archive/ipinfo-2.2.0.tar.gz")
sha256sums=('14ff13cd52d1344c7b683de19eb8cbaa53852d7c20d11dfffc0dd28b66b4cd35')
_vendorpath="gopath/src/$_vendor"

build() {
  cd $srcdir/cli-${pkgname}-${pkgver}/${pkgname}
  go build
}

package() {
  install -Dm755 $srcdir/cli-${pkgname}-${pkgver}/${pkgname}/${pkgname} $pkgdir/usr/bin/$pkgname
}
