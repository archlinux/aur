# Maintainer: Tommy Li <ttoo74@gmail.com>
pkgname=python-sacremoses
_name=${pkgname#python-}
pkgver=0.0.19
pkgrel=1
pkgdesc="Python port of Moses tokenizer, truecaser and normalizer"
arch=(any)
url="https://github.com/alvations/sacremoses"
license=('LGPL')
depends=("python" "python-six" "python-joblib" "python-tqdm")
makedepends=()
checkdepends=()
optdepends=()
options=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('4220bf1474b2d735b6d7e2b27e839ac110cf0f9b4fc244fd649707dd738e3430')

prepare() {
	cd "$_name-$pkgver"
}

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
