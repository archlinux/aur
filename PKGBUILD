# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=python-nptyping
pkgver=1.4.0
pkgrel=1
pkgdesc='Type hints for Numpy'
url="https://github.com/ramonhagenaars/nptyping"
arch=(x86_64)
license=(MIT)
depends=(
python
python-numpy
python-typish
)
makedepends=(python-setuptools)
checkdepends=(
python-pycodestyle
python-pylint
python-pytest
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ramonhagenaars/nptyping/archive/v${pkgver}.tar.gz")
sha512sums=('ad2bfe3de6e7a963de6ac72069e1e8255ed7423a52040bfc456487ac57ad762c130005949b0514d660b1fc99749a75c0ff49b1f884649316672fe8c1f7a4f156')

build() {
  cd nptyping-${pkgver}
  python setup.py build
}

check(){
  cd nptyping-${pkgver}
  python setup.py test
}

package() {
  cd nptyping-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
