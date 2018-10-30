# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>
_pkgname=django-otp
pkgname=python-django-otp
pkgver=0.5.1
pkgrel=1
pkgdesc="A framework for adding two-factor authentication to Django using one-time passwords"
url="https://bitbucket.org/psagers/django-otp"
license=('BSD')
arch=('any')
depends=('python' 'python-django' )
optdepends=('python-qrcode: For OTP setup with QR code')
makedepends=('python' 'python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-$pkgver.tar.gz")
sha512sums=('bdce0ef01013bed059ac4cb2c3d4ccb9ce8c6da94451f4b1a8ff8b7ea03e6206d6b357550af6b423aabf17a4bca8065eec171e6b8b16b2a4c05bbb3234d0db20')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sts=2 sw=2 et ft=PKGBUILD
