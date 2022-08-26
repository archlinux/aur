# Maintainer: Juacrumar <juacrumar at lairen dot eu>

pkgname=python-eko
_name=eko
pkgver=0.10.2
pkgrel=1
pkgdesc='Python module to solve the DGLAP equations in N-space in terms of Evolution Kernel Operators in x-space.'
arch=('any')
url="https://eko.readthedocs.io/"
license=('GPL-3')
makedepends=("python-setuptools")
depends=("python>=3.8"
         "python-numba-git"
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
md5sums=("d263f7928c77d730bcafbfbf9444e8da")

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
