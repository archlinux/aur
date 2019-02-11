# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>
_name=sphinx-sitemap
pkgname=python-sphinx-sitemap
pkgver=1.0.2
pkgrel=1
pkgdesc="Sphinx extension to silently generate a sitemap for HTML builds"
url="https://github.com/jdillard/sphinx-sitemap"
license=('MIT')
arch=('any')
depends=('python-sphinx' 'python-six')
makedepends=('python-setuptools')
source=("${_name}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('3bfe3b6d78b6c8240f76d2115cbdf7035b5d5ebaacf7fafa5b23fe47f5f920b24b3cb843fe907ad6aae7116c4e302c0a5646bdcfe5f08e2c222c422850727669')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sts=2 sw=2 et ft=PKGBUILD
