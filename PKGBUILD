# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=wrench
pkgver=0.4.2
pkgrel=4
pkgdesc='a CLI tool for Passbolt'
arch=('any')
url='https://github.com/liip/wrench'
license=('GPL3')
depends=('python' 'python-requests-gpgauthlib' 'python-requests' 'python-click')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-runner' 'python-pytest-cov' 'python-requests-mock' 'python-faker')
source=("https://github.com/liip/wrench/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('df197493031219ac21a77ec3a70376f41fffa921dcc7cabb92c4e09bb2845c17522a971d539098bdbeb3cc55529c5348a3db6ec01a10c163f42afd074ef87de2')

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

check() {
  cd ${pkgname}-${pkgver}
  python setup.py test
}

package() {
  cd ${pkgname}-${pkgver}
  NO_THIRD_PARTY=true python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
