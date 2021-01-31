# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-smbprotocol
pkgver=1.3.0
pkgrel=1
pkgdesc="Python SMBv2 and v3 Client"
arch=(x86_64)
url=https://github.com/jborean93/smbprotocol
license=(MIT)
depends=(
python
python-gssapi
python-ntlm-auth
python-cryptography
python-pyspnego
python-six
)
makedepends=(python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jborean93/smbprotocol/archive/v${pkgver}.tar.gz")
sha256sums=('555cc183762cd1c477d34b1551bbdb0ef6518b4591a26e3227ed60acc7740195')

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
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}

# vim:ts=2:sw=2:et:
