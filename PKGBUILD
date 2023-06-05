# Maintainer: Juacrumar <juacrumar at lairen dot eu>

pkgname=python-eko
_name=eko
pkgver=0.13.4
pkgrel=1
pkgdesc='Python module to solve the DGLAP equations in N-space in terms of Evolution Kernel Operators in x-space.'
arch=('any')
url="https://eko.readthedocs.io/"
license=('GPL-3')
makedepends=(python-build python-installer python-wheel python-poetry-core python-poetry-dynamic-versioning)
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
md5sums=("1be00b83649d8b98961445dbee78181a")

prepare() {
	cd "$_name-$pkgver"
}

build() {
	cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
