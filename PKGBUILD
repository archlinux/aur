# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-smbprotocol
pkgver=1.0.1
pkgrel=1
pkgdesc="Python SMBv2 and v3 Client"
arch=('x86_64')
url=https://github.com/jborean93/smbprotocol
license=('MIT')
depends=(python python-gssapi python-ntlm-auth)
makedepends=(python-setuptools)
source=(https://github.com/jborean93/smbprotocol/archive/v${pkgver}.tar.gz)
sha256sums=('e03296995e89f82524f20654113e531f7133d113382e6078c418bbc0edd80fb4')

prepare() {
  cd "$srcdir/smbprotocol-$pkgver"
}

build() {
  cd "$srcdir/smbprotocol-$pkgver"
  python setup.py build
}


package() {
  cd "$srcdir/smbprotocol-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
