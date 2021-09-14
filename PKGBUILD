# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Daniel Moch <daniel AT danielmoch DOT com>
_name=django-otp
pkgbase=python-django-otp
pkgname=('python-django-otp')
pkgver=1.1.1
pkgrel=1
pkgdesc="A pluggable framework for adding two-factor authentication to Django using one-time passwords"
url="https://github.com/django-otp/django-otp"
license=('BSD')
arch=('any')
optdepends=('python-qrcode: For OTP setup with QR code')
makedepends=('python-setuptools')
depends=('python' 'python-django')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha512sums=('4481d515041e13d02bf61c5539cc414f6d1851e183e4069ef74c18f156f6b6ae581e442d9c91ee19a2114bb1efcfed5954ea11248e953985c0fc8c6b0086d9bb')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py build
}

package() {

  cd "$srcdir/${_name}-${pkgver}/"
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
