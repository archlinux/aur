# Maintainer: Jan Niklas Böhm <mail@jnboehm.com>
# Contributer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributer: Eli Patterson <elipup@gmail.com>
# Contributer: Franz Müller <ethylisocyanat@gmail.com>

_pkgname='osmnx'
pkgname="python-${_pkgname}"
pkgver=1.2.2
pkgrel=1
pkgdesc='Retrieve, model, analyze, and visualize OpenStreetMap street networks and other spatial data'
arch=('any')
url='https://github.com/gboeing/osmnx'
_url_pypi='https://pypi.org/project/osmnx'
license=('MIT')
depends=('python-descartes'
        'python-folium'
        'python-geopandas'
        'python-matplotlib'
        'python-networkx'
        'python-numpy'
        'python-pandas'
        'python-pyproj'
        'python-requests'
        'python-rtree'
        'python-scikit-learn'
        'python-scipy'
        'python-shapely')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('30924452ca02758ece3301f9fcfb1b80edf31e2be7abe7fa7e0fefddb5050408')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
