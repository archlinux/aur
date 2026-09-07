# Maintainer: mark.blakeney at bullet-systems dot net
# Contributor: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aetf <aetf at unlimitedcodeworks dot xyz>

_pkgname=coolname
pkgname=python-$_pkgname
pkgver=5.0.0
pkgrel=1
pkgdesc="Random Name and Slug Generator"
url="https://github.com/alexanderlukanin13/$_pkgname"
arch=('any')
license=('BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('caf9b8f3f8371ef8b3e9eea87c659fbf0aff351087a87b335c84dabadb0aa328')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
