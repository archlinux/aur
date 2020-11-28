# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=python-nptyping
pkgver=1.3.0
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
sha512sums=('05dc5e22c2d71dbff3fdb5fb086d627a03e912d2ed43a64c0522675f8334212afd7105bd09723bc1f09d59c968de8a96ef6e9ee11cb508cb1db301f22fa1b96e')

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
