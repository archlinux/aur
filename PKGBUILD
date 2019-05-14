# Maintainer: jerry73204 <jerry73204 at google gmail>

pkgname='python-mapbox-vector-tile'
pkgver=1.2.0
pkgrel=1
pkgdesc='Python package for encoding & decoding Mapbox Vector Tiles'
arch=('any')
url='https://github.com/tilezen/mapbox-vector-tile'
license=('MIT')
makedepends=('python-setuptools')
depends=('python-protobuf'
         'python-shapely'
         'python-future'
         'python-pyclipper')
source=("https://github.com/tilezen/mapbox-vector-tile/archive/v${pkgver}.tar.gz")
sha256sums=('ec82ab629f82009155f485bec2a46a7d4f0b8ab01df4ff599cb71b030d463679')

build() {
  cd "${srcdir}/mapbox-vector-tile-${pkgver}"
  python setup.py build
}

package_python-mapbox-vector-tile() {
  cd "${srcdir}/mapbox-vector-tile-${pkgver}"
  python setup.py install --skip-build --prefix=/usr --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README* "${pkgdir}/usr/share/doc/${pkgname}/README"
}
