# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributor: Evangelos Foutras <foutrelis@archlinux.org>

_name=sphinxcontrib-spelling
pkgname=python-$_name
pkgver=8.0.1
pkgrel=1
pkgdesc="Spelling checker for Sphinx"
arch=('any')
url="https://sphinxcontrib-spelling.readthedocs.io/"
license=('BSD-3-Clause')
depends=('python-sphinx' 'python-pyenchant' 'python-requests')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools' 'python-setuptools-scm')
source=("git+https://github.com/sphinx-contrib/spelling.git#tag=$pkgver")
sha256sums=('a82e9285f7952bdd03fade53076e23c1f4306d666acae1559b8abdca9603beae')

build() {
  cd spelling
  python -m build --wheel --no-isolation
}

package() {
  cd spelling
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
