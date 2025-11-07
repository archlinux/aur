# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=python-puzpy
pkgver=0.3.2
pkgrel=1
pkgdesc="Python library for reading and writing across lite crossword puzzle .puz files."
arch=('any')
url="https://github.com/alexdej/puzpy"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-setuptools')
depends=('python')
source=(https://files.pythonhosted.org/packages/source/p/${pkgname/python-/}/${pkgname/python-/}-${pkgver}.tar.gz)
b2sums=('129e956fde58a20ca8660be3735ae4aff704b228fbc08577af48ad056019d85bf3cb0bdd0c76fd752f4b2a4238c11fe2ba7ffa413c209d39c11a610339f172c2')

build() {
  cd "${pkgname/python-/}-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname/python-/}-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/python-puzpy/LICENSE
}
