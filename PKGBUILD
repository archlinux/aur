# Maintainer: Juacrumar <juacrumar at lairen dot eu>

pkgname=python-vegasflow
_name=vegasflow
pkgver=1.1.0
pkgrel=1
pkgdesc='Monte Carlo integration library written in Python and based on the TensorFlow framework'
arch=('any')
url="https://vegasflow.readthedocs.io/"
license=('GPL3')
depends=("python>=3.6"
         "python-tensorflow"
         "python-joblib"
         "python-numpy")
optdepends=("python-cffi: interfacing vegasflow with C code"
             "python-tensorflow-cuda: GPU support")
# checkdepends=("python-pytest")
provides=("vegasflow")
changelog=
source=("https://github.com/N3PDF/vegasflow/archive/v${pkgver}.tar.gz")
md5sums=("4fccae4f8d3add536f86694af6697bdc")

prepare() {
	cd "$_name-$pkgver"
}

# check() {
# 	cd "$_name-v$pkgver"
#     pytest
# }

build() {
	cd "$_name-$pkgver"
    python setup.py build 
}

package() {
	cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=2 --skip-build
}
