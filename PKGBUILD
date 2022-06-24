# Maintainer: Liam Timms <timms5000@gmail.com>

pkgname=python-dcm2bids
_name=${pkgname/python-/}
pkgver=2.1.9
pkgrel=1
pkgdesc="Reorganising NIfTI files from dcm2niix into the Brain Imaging Data Structure"
arch=('any')
url="https://github.com/cbedetti/Dcm2Bids"
license=('GPL3')
depends=('dcm2niix')
makedepends=('python-setuptools' 'python-setuptools-scm')
options=(!emptydirs)
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/9e/27/b447d04e9aba35160eaa2a4077be14e597e338253b16a491a6592ae0539d/${_name}-${pkgver}.tar.gz"
)
sha256sums=('d962bd0a7f1ed200ecb699e8ddb29ff58f09ab2f850a7f37511b79c62189f715')

build() {
  cd "$srcdir"/${_name}-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/${_name}-$pkgver
  python setup.py install --skip-build --root="$pkgdir"/ --optimize=1
}

