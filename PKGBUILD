# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Daniel Moch <daniel AT danielmoch DOT com>
_name=django-otp
pkgbase=python-django-otp
pkgname=('python-django-otp')
pkgver=1.0.2
pkgrel=1
pkgdesc="A pluggable framework for adding two-factor authentication to Django using one-time passwords"
url="https://github.com/django-otp/django-otp"
license=('BSD')
arch=('any')
optdepends=('python-qrcode: For OTP setup with QR code')
makedepends=('python-setuptools')
depends=('python' 'python-django')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha512sums=('01439e7669b69ecdde6a52c20d9712c1714e6f008540f80f524b96dbaf86c6c4355aa378e9cf8f0434c1dc4822d551efe03c289795c5b460f1ec2c059ec7bbec')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py build
}

package() {

  cd "$srcdir/${_name}-${pkgver}/"
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
