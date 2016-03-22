_pypiname=wsgiref
pkgname=python-wsgiref
pkgver=0.1.2
pkgrel=1
pkgdesc="This is a standalone release of the wsgiref library, that provides validation support for WSGI 1.0.1"
arch=(any)
source=("https://pypi.python.org/packages/source/w/wsgiref/${_pypiname}-${pkgver}.zip")
license=("PSF" "ZPL")
makedepends=("python" "python-setuptools")
md5sums=('29b146e6ebd0f9fb119fe321f7bcf6cb')

prepare() {
  cd "$_pypiname-${pkgver}"
  2to3 -w .
}

package() {
  cd "$_pypiname-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
