# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>

pkgname=python-django-otp
pkgver=0.4.3
pkgrel=1
pkgdesc="A framework for adding two-factor authentication to Django using one-time passwords"
url="https://bitbucket.org/psagers/django-otp"
license=('BSD')
arch=('any')
depends=('python' 'python-django' )
optdepends=('python-qrcode: For OTP setup with QR code')
makedepends=('python' 'python-setuptools')
source=(django-otp-$pkgver.tar.gz::https://pypi.python.org/packages/07/70/21b67af8b22f4cf4dd99bc3ebb5a9891488392ab26b17c3e62e2dea76c41/django-otp-$pkgver.tar.gz#md5=5b078961be8b9b48207dc30710991df4)
sha512sums=('3f3ec761dc12ed40e8c757dfbe1fd951c7c6aed3abc311c823acdeca08d5864b54c8442a49807228be17b30c20093b1ba7fb8b2c0f86f00dc1cc215ccd7c28de')

build() {
  cd "$srcdir/django-otp-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/django-otp-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sts=2 sw=2 et ft=PKGBUILD
