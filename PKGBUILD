# Maintainer: Lukas Zimmermann <luk.zim91 at gmail dot com> 
# Contributor: Kelsey Maes <kelseymaes at outlook dot com>

pkgname=python-knack
pkgver=0.8.2
pkgrel=1
pkgdesc="A Python command line interface framework"
arch=('any')
url="https://github.com/Microsoft/knack"
license=('MIT')
depends=('python-argcomplete' 'python-colorama' 'python-jmespath' 'python-six' 'python-tabulate' 'python-yaml')
makedepends=('python-setuptools')
checkdepends=('python-mock' 'python-pytest')
source=("https://github.com/Microsoft/knack/archive/v${pkgver}.tar.gz")
sha256sums=('1daaf44c6e526addc60906a68b9cac2d32415ffc24a4dbe8a640f12ba477eacd')

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

