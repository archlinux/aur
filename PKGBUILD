# Maintainer: redfish <redfish@galactica.pw>

pkgname=stemns
_name=StemNS
pkgver=0.3
pkgrel=1

pkgdesc='Tor plugin for resolving names using Stem'
url='https://github.com/namecoin/StemNS'
arch=(x86_64 armv7h)
license=(Unlicense BSD)

# Upstream recommends python-stem >= v1.9, but it is untagged, see:
# https://github.com/namecoin/StemNS/commit/949003728214f430706d794cd5c359cd0e11441c
depends=('python-stem>=1.8.2')
optdepends=(
	'tor>=0.4.5.1: anonymizing overlay network'
)
makedepends=()
install=stemns.install

source=($pkgname-${pkgver}.tar.gz::https://github.com/namecoin/StemNS/archive/v${pkgver}.tar.gz
	stemns.service)

package() {
  cd $srcdir/$_name-$pkgver
  install -Dm 644 -t "$pkgdir/opt/$pkgname" *.py
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm 644 -t "$pkgdir/usr/lib/systemd/system/" $srcdir/stemns.service
}

sha512sums=('f7fda5a27a5f00af24f523aa2d18e03cbd8a1cdc1bcd9867b8dd2eb68faa7ad4bc34bed8b0d80334d97f62cfebfb187ae151c9b1e5f8b63aaeb87c199397a958'
            '75bc2987995aed6143a44677908f847d7537c6c1870263a92b7ac16a0c40f779391a7442c40a7815dba8f18e16e75dd2957a285e2d13076c9c93439b06294e39')
