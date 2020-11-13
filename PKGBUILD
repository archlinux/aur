# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='waybackpack'
pkgver=0.3.7
pkgrel=1
pkgdesc='Download the entire Wayback Machine archive for a given URL'
arch=('any')
url='https://github.com/jsvine/waybackpack'
_url_pypi='https://pypi.org/project/waybackpack'
license=('MIT')
depends=('python' 'python-requests')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2445a142932b74816d4ef0e136877c2f0ae0e95a1c07d79f81df06504b210e1e')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.txt' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
