# Maintainer: Lukas Zimmermann <luk.zim91 at gmail dot com> 
# Contributor: Kelsey Maes <kelseymaes at outlook dot com>

pkgname=python-knack
pkgver=0.9.0
pkgrel=2
pkgdesc="A Python command line interface framework"
arch=('any')
url="https://github.com/Microsoft/knack"
license=('MIT')
depends=('python-argcomplete' 'python-colorama' 'python-jmespath' 'python-six' 'python-tabulate' 'python-yaml')
makedepends=('python-setuptools')
checkdepends=('python-mock' 'python-pytest')
source=("https://github.com/Microsoft/knack/archive/v${pkgver}.tar.gz")
sha256sums=('520f7ac0aeeca85b9b33c2612482e7b6d5da898c1e2f32c00408ce32976fad21')

build() {
  cd "knack-${pkgver}"
  python setup.py build
}

check() {
  cd "knack-${pkgver}"
  pytest
}

package() {
  cd "knack-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
