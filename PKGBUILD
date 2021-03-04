# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-smbprotocol
pkgver=1.4.0
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
sha256sums=('f80ae1ba742f7336cc882914faa1ee65ef247278bf898b995cc0ecfeaa830847')

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
