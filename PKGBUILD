pkgbase=python2-marshmallow-jsonapi
pkgname=(python-marshmallow-jsonapi python2-marshmallow-jsonapi)
pkgver=0.14.0
pkgrel=2
pkgdesc="JSON API 1.0 (https://jsonapi.org) formatting with marshmallow"
url="https://github.com/marshmallow-code/marshmallow-jsonapi"
makedepends=('python' 'python2')
license=('MIT')
arch=('any')
source=("https://github.com/marshmallow-code/marshmallow-jsonapi/archive/${pkgver}.tar.gz")
md5sums=('9bcfc5cfb27592549fe912dd71d6a49c')

prepare() {
  cp -a marshmallow-jsonapi-${pkgver}{,-py2}
}

build() {
  cd "$srcdir"/marshmallow-jsonapi-${pkgver}
  python setup.py build

  cd "$srcdir"/marshmallow-jsonapi-${pkgver}-py2
  python2 setup.py build
}

package_python-marshmallow-jsonapi() {
  depends=('python-marshmallow')
  cd "$srcdir"/marshmallow-jsonapi-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 
}

package_python2-marshmallow-jsonapi() {
  depends=('python2-marshmallow')
  cd "$srcdir"/marshmallow-jsonapi-${pkgver}-py2
  python2 setup.py install --root="$pkgdir" --optimize=1 
}
