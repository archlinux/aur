# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=python-nptyping
pkgver=1.4.4
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
sha512sums=('4dd124734fde7e19867af0efd0c3a79f220b20576cb2f34a1cfb5e47c4fde44e936dca708d68bef99eb554afe7576f7fee447d6dd73f3c136340c8f48770f7b8')

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
