# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=wayback-machine-archiver
pkgver=1.8.1
pkgrel=1
pkgdesc='Submit web pages to the Wayback Machine for archiving'
arch=('any')
url='https://github.com/agude/wayback-machine-archiver'
license=('MIT')
depends=('python' 'python-requests')
makedepends=('python-setuptools')
#checkdepends=('python-pytest' 'python-requests-mock')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('2bd12ed8d31d0eae6f7a4e7f6f7a80052de0e0e8243e5c0538a6195bcd6decce')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

#check(){
#  cd "${pkgname}-${pkgver}"
#  pytest
#}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
