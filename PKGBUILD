#Maintainer: Dylan Delgado <dylan1496 at live dot com>

pkgname=python-sdf
pkgver=0.3.6
pkgrel=1
pkgdesc="Python library to work with the Scientific Data Format"
url="https://github.com/ScientificDataFormat/SDF-Python"
arch=('x86_64')
license=('custom:BSD 3-clause')
depends=('python-numpy' 'python-matplotlib' 'python-scipy' 'python-h5py')
makedepends=('python-setuptools')
source=("https://github.com/ScientificDataFormat/SDF-Python/archive/refs/tags/v${pkgver}.tar.gz"
"LICENSE")
sha256sums=('da51cb64c411cfdd4bc335f6e29f004917005b4ae25c9220f21ce82a93ead10c'
'SKIP')

build() {
  cd ${srcdir}/SDF-Python-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/SDF-Python-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --skip-build
  cd ..
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
