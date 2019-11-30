# Maintainer: Liam Timms <timms5000@gmail.com>

pkgname=python-dcm2bids
_name=${pkgname/python-/}
pkgver=2.1.4
pkgrel=1
pkgdesc="Reorganising NIfTI files from dcm2niix into the Brain Imaging Data Structure"
arch=('any')
url="https://github.com/cbedetti/Dcm2Bids"
license=('GPL3')
depends=('dcm2niix')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("${_name}-${pkgver}.tar.gz::https://github.com/cbedetti/Dcm2Bids/archive/${pkgver}.tar.gz")
sha256sums=('b702da2988734a6506310bf1a530d631b2e528df5373368e476f780acd7bc9ab')

build() {
  cd "$srcdir"/Dcm2Bids-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/Dcm2Bids-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1
}

