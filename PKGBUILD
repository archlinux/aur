# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname='python-memcached'
_pypi_pkgname='python-memcached'
pkgver=1.59
pkgrel=0
pkgdesc="A python memcached client library"
arch=('any')
url="https://github.com/linsomniac/python-memcached"
license=('PSF')

source=(https://files.pythonhosted.org/packages/source/p/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz)
makedepends=('python')
depends=('python' 'memcached')
md5sums=('fe5a7c66da01b0c4f5223a4db8cb8659')

build() {
  cd "${_pypi_pkgname}-${pkgver}"
  python setup.py build
}


package() {
  cd "$srcdir/python-memcached-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
