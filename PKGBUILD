# Maintainer: Juacrumar <juacrumar at lairen dot eu>

pkgname=python-banana-hep
_name=banana-hep
pkgver=0.6.5
pkgrel=1
pkgdesc='Benchmarking infrastructure and utilities for Deep Inelastic Scattering and evolution codes used in High Energy Physics.'
arch=('any')
url="https://banana-hep.readthedocs.io/"
license=('GPL-3')
makedepends=("python-setuptools")
depends=("python>=3.8"
         "python-click"
         "python-matplotlib"
         "python-numpy"
         "python-pandas"
         "python-pendulum"
         "python-yaml"
         "python-rich"
         "python-sqlalchemy"
         )

optdepends=("lhapdf: provides PDF files in the LHAPDF format"
            "python-eko: Python module to solve the DGLAP equations"
             )
provides=("python-banana-hep")
changelog=
source=("https://pypi.io/packages/source/b/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=("8b3786476df0fcc06996cddb24a7fcbe")

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
