# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

_name=sphinxcontrib-applehelp
pkgname=python2-$_name
pkgver=1.0.2
pkgrel=6
pkgdesc='Sphinx extension which outputs Apple help books'
arch=('any')
url=https://github.com/sphinx-doc/sphinxcontrib-applehelp
license=('BSD')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest' 'python2-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a072735ec80e7675e3f432fcae8610ecf509c5f1869d17e2eecff44389cdbc58')

build() {
  cd $_name-$pkgver
  python2 setup.py build
}

# check() {
#   cd $_name-$pkgver
#   pytest2 --disable-pytest-warnings
# }

package() {
  cd $_name-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
