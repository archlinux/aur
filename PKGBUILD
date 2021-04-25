# Maintainer: redfish <redfish@galactica.pw>

pkgname=stemns
_name=StemNS
pkgver=0.1.1
pkgrel=1

pkgdesc='Tor plugin for resolving names using Stem'
url='https://github.com/namecoin/StemNS'
arch=(x86_64 armv7h)
license=(Unlicense BSD)

depends=('python-stem')
optdepends=(
	'tor: anonymizing overlay network'
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

sha512sums=('f2a3b87d78e8d54002a06e14254fc240d624803bfd41d80bd7bd6aa689794b3fec9c2c77a1ae95a86673a8d823646c001d6d4079eb545d3e4f10b539f3234e5c'
            '75bc2987995aed6143a44677908f847d7537c6c1870263a92b7ac16a0c40f779391a7442c40a7815dba8f18e16e75dd2957a285e2d13076c9c93439b06294e39')
