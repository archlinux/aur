# Maintainer: Philipp Joram <mail [at] phijor [dot] me>

pkgname='python-dacite'
_name=${pkgname#python-}
pkgver=1.6.0
pkgrel=1
pkgdesc="Simplify creation of data classes (PEP 557) from dictionaries."
url="https://github.com/konradhalas/dacite"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('d34b4dfd1192cb285a7cc34da8a87cfda87129db9b3ac026a7ce3dc01d227093b6db920c6eba148fc8a4be1d0fec57f50b117877419419d06264ad1a79ffaa15')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
