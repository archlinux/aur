# Maintainer: jerry73204 <jerry73204 at google gmail>

pkgname='python-geoplot'
pkgver=0.2.1
pkgrel=1
pkgdesc='High-level geospatial data visualization library for Python'
arch=('any')
url='https://github.com/ResidentMario/geoplot'
license=('MIT')
makedepends=('python-setuptools')
depends=('python-matplotlib'
         'python-seaborn'
         'python-pandas'
         'python-geopandas'
         'python-cartopy'
         'python-descartes')
source=("https://github.com/ResidentMario/geoplot/archive/${pkgver}.tar.gz")
sha256sums=('e336bf84c4040a9c7e68f90ba5744d1149a19854eb0b34551def8bd7c2a299d6')

build() {
  cd "${srcdir}/geoplot-${pkgver}"
  python setup.py build
}

package_python-geoplot() {
  cd "${srcdir}/geoplot-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README* "${pkgdir}/usr/share/doc/${pkgname}/README"
}
