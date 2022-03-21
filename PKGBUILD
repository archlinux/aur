pkgbase=python2-marshmallow-jsonapi
pkgname=(python-marshmallow-jsonapi python2-marshmallow-jsonapi)
pkgver=0.24.0
pkgrel=1
pkgdesc="JSON API 1.0 (https://jsonapi.org) formatting with marshmallow"
url="https://github.com/marshmallow-code/marshmallow-jsonapi"
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/marshmallow-code/marshmallow-jsonapi/archive/${pkgver}.tar.gz")
sha256sums=('d73495733efc528580faf0eb2242581856f689e92ae7d466ca9fccbf8d6abd35')

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
