# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

_name=sphinxcontrib-htmlhelp
pkgname=python2-$_name
pkgver=2.0.0
pkgrel=1
pkgdesc='Sphinx extension which renders HTML help files'
arch=('any')
url=https://github.com/sphinx-doc/sphinxcontrib-htmlhelp
license=('BSD')
makedepends=('python2-setuptools')
checkdepends=('python2-html5lib' 'python2-pytest' 'python2-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f5f8bb2d0d629f398bf47d0d69c07bc13b65f75a81ad9e2f71a63d4b7a2f6db2')
b2sums=('09b0d9bcec57140278c4476fa0bbc40d359fc167d8ea891a1585fbdeafe6eb0b52442dbbc8d1d5b6edb3953b04fc29a71f6f74e58a281ebb0d79e5a30cb02749')

build() {
  cd $_name-$pkgver
  python2 setup.py build
}

# check() {
#   cd $_name-$pkgver
#   pytest2
# }

package() {
  cd $_name-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
