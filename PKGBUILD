# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='wayback-machine-archiver'
pkgver=1.9.0
pkgrel=1
pkgdesc='Submit web pages to the Wayback Machine for archiving'
arch=('any')
url='https://github.com/agude/wayback-machine-archiver'
_url_pypi='https://pypi.org/project/wayback-machine-archiver'
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('dc944fda4e490268a696ebd06cd3e6d03a2d92c590247f75528e45ccdbaf8f8a')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
