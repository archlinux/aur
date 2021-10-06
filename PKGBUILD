# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

_name=sphinxcontrib-jsmath
pkgname=python2-sphinxcontrib-jsmath
pkgver=1.0.1
pkgrel=9
pkgdesc='Sphinx extension which renders display math in HTML via JavaScript'
arch=('any')
url=https://github.com/sphinx-doc/sphinxcontrib-jsmath
license=('BSD')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest' 'python2-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a9925e4a4587247ed2191a22df5f6970656cb8ca2bd6284309578f2153e0c4b8')

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
