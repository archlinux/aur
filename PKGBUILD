# Contributor: Riccardo Berto <riccardo at rcrdbrt dot com>

pkgname='python-cloudant'
_name='cloudant'
pkgver=2.14.0
pkgrel=1
pkgdesc="Cloudant / CouchDB Client Library"
url="https://github.com/cloudant/python-cloudant"
depends=('python-requests')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('afb00331a6c8593ba849294e907ebf188ee90548b1b96d0ee98669ffeb5df320')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
