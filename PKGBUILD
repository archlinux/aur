# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>

pkgname=python-django-csp
pkgver=3.3
pkgrel=1
pkgdesc="Django Content Security Policy support."
url="https://github.com/mozilla/django-csp"
license=('BSD')
arch=('any')
depends=('python-django')
source=(django_csp-$pkgver.tar.gz::https://pypi.python.org/packages/20/f7/00681fc37fbb359dd2796e16073e1d7cf50b0c42cceeb7d6b3f127ba8f34/django_csp-$pkgver.tar.gz)
sha512sums=('92a101eeae11551f6ff59df2ffba78e155f827e05a21aef99873f2cc3d192cbe558c98eb6e34eee1ee2202756c27ce20caacfc3b410a200454e6076fd62e1d0a')

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
