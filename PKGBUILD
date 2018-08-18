# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>

pkgname=python-django-otp
pkgver=0.5.0
pkgrel=1
pkgdesc="A framework for adding two-factor authentication to Django using one-time passwords"
url="https://bitbucket.org/psagers/django-otp"
license=('BSD')
arch=('any')
depends=('python' 'python-django' )
optdepends=('python-qrcode: For OTP setup with QR code')
makedepends=('python' 'python-setuptools')
source=(django-otp-$pkgver.tar.gz::https://files.pythonhosted.org/packages/6b/05/ecf200287a642703d7d2b1c5776a8de8b2e2cfe7aeefaa242bce859db08e/django-otp-$pkgver.tar.gz)
sha512sums=('4e84674004dbf610cbdf7fa7e8e3ce968860b94f6828441773ad46c98c8742ef762de041870982254e62116d7900b287bb3a2ca79ec70141d2853ed9c2e1ecfb')

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
