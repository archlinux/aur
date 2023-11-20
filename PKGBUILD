# Maintainer: Maik93 <michael.mugnai@gmail.com>

pkgname=rockit
pkgver=0.1.32
pkgrel=1
pkgdesc="An Optimal Control Problem abstraction class, built on top of CasADi"
arch=('i686' 'x86_64')
url="https://gitlab.kuleuven.be/meco-software/rockit"
_branch=master
license=('GPL3')
depends=('python' 'python-numpy' 'python-matplotlib' 'python-scipy' 'casadi')
makedepends=('git' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('20b84cefe7612c49d0a5996571121ded686e5c7328bfd62ab15167ec3aed80e4')

build() {
  cd "${pkgname}-v${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-v${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
