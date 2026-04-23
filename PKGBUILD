# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributor: Evangelos Foutras <foutrelis@archlinux.org>

_name=sphinxcontrib-spelling
pkgname=python-$_name
pkgver=8.0.2
pkgrel=4
pkgdesc="Spelling checker for Sphinx"
arch=('any')
url="https://sphinxcontrib-spelling.readthedocs.io/"
license=('BSD-3-Clause')
depends=('python-sphinx' 'python-pyenchant' 'python-requests')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel'
             'python-hatchling' 'python-hatch-vcs')
source=("git+https://github.com/sphinx-contrib/spelling.git#tag=$pkgver")
sha256sums=('24695eef3545558e70d6d112bec4e7500521d6dc88f0b05464b4ec3dda1da395')

build() {
  cd spelling
  python -m build --wheel --no-isolation
}

package() {
  cd spelling
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
