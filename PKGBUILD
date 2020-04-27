pkgbase=python2-marshmallow-jsonapi
pkgname=(python-marshmallow-jsonapi python2-marshmallow-jsonapi)
pkgver=0.23.1
pkgrel=1
pkgdesc="JSON API 1.0 (https://jsonapi.org) formatting with marshmallow"
url="https://github.com/marshmallow-code/marshmallow-jsonapi"
makedepends=('python' 'python2')
license=('MIT')
arch=('any')
source=("https://github.com/marshmallow-code/marshmallow-jsonapi/archive/${pkgver}.tar.gz")
sha256sums=('e16662ec78a98e4ef74586b648870bbe246abf118bada36428bd861984e21cf5')

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
