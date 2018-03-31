# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>

pkgname=python-django-csp
pkgver=3.4
pkgrel=1
pkgdesc="Django Content Security Policy support."
url="https://github.com/mozilla/django-csp"
license=('BSD')
arch=('any')
depends=('python-django')
source=(django_csp-$pkgver.tar.gz::https://pypi.python.org/packages/38/f0/6e8598cda39aafe31abf1c59b99633d07123d316058caa5aa947d207a166/django_csp-$pkgver.tar.gz)
sha512sums=('d1c1a6cabe268649f312ccb5c7cf3e2bca3261b08d6c56ef2866e8150fde2a3514ec3026eec5ee7278a830041b4b57634612bfbac36e20e7b07de0d2fd925585')

build() {
  cd "$srcdir/django_csp-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/django_csp-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sts=2 sw=2 et ft=PKGBUILD
