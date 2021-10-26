# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

_name=sphinxcontrib-serializinghtml
pkgname=python2-$_name
pkgver=1.0.0
pkgrel=1
pkgdesc='Sphinx extension which outputs "serialized" HTML files (json and pickle)'
arch=('any')
url=https://github.com/sphinx-doc/sphinxcontrib-serializinghtml
license=('BSD')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest' 'python2-sphinx')
source=("git+$url#tag=$pkgver")
sha256sums=(SKIP)
b2sums=(SKIP)

build() {
  cd $_name
  python2 setup.py build
}

# check() {
#   cd $_name-$pkgver
#   pytest2
# }

package() {
  cd $_name
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
