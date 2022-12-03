# Maintainer:
# Contributor: Grey Christoforo <grey at christoforo dot net>

pkgname=python-nptyping
pkgver=2.4.1
pkgrel=1
pkgdesc='Type hints for Numpy'
url="https://github.com/ramonhagenaars/nptyping"
arch=(x86_64)
license=(MIT)
depends=(python-numpy python-typing_extensions)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ramonhagenaars/nptyping/archive/v${pkgver}.tar.gz")
sha512sums=('df2694743c5ee349f2dc2b119b38f2d0d5d38b51a0dcf8336c7e17bd9075e05e94d76d01a35156069a6c95310f69bca9040f972a7efa6e7e581503ad77730520')

build() {
  cd nptyping-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd nptyping-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
