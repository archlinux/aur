# Maintainer: Arun Mahapatra <arun@codito.in>

pkgname=bout
pkgver=1.0.1
pkgrel=1
pkgdesc="Parse and export pdf bank statements to QIF format."
url="https://github.com/codito/bout"
license=("MIT")
arch=("any")
provides=("bout")
makedepends=("python-setuptools")
depends=("python" "python-click" "python-tabula")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=("052ad595521415a3cfa8e6fbb58e6258b41b0b8801d563e955ac2fa8a18837a78a0d4ae33ba16a4252a2196d0f417d37d8a4d8c69c47aff86560c1c3e273e5df")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
