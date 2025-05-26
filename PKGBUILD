# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=python-marshalparser
_name=${pkgname#python-}
pkgver=0.4.0 
pkgrel=1
pkgdesc='Parser for byte-cache .pyc files'
arch=(any)
url=https://pypi.org/project/marshalparser
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d1b15012106cf1fb025e98c7df2d5d394c26e9c39bb713da4e98265b0f285b47')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

