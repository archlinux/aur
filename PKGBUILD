# Maintainer: Juacrumar <juacrumar at lairen dot eu>

pkgname=python-eko
_name=eko
pkgver=0.12.0
pkgrel=1
pkgdesc='Python module to solve the DGLAP equations in N-space in terms of Evolution Kernel Operators in x-space.'
arch=('any')
url="https://eko.readthedocs.io/"
license=('GPL-3')
makedepends=("python-setuptools")
depends=("python>=3.8"
         "python-numba"
         "python-numpy"
         "python-yaml"
         "python-lz4"
         "python-scipy"
         )

optdepends=("lhapdf: provides PDF files in the LHAPDF format"
            "pineappl: grid generation for HEP"
             )
provides=("python-eko")
changelog=
source=("https://pypi.io/packages/source/e/eko/eko-${pkgver}.tar.gz")
md5sums=("6cfbdad2588dcb06cee899178f9c80a7")

prepare() {
	cd "$_name-$pkgver"
}

build() {
	cd "$_name-$pkgver"
    python setup.py build 
}

package() {
	cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=2 --skip-build
}
