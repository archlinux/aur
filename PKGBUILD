# Maintainer: Juacrumar <juacrumar at lairen dot eu>

pkgname=python-pdfflow
_name=pdfflow
pkgver=1.1
pkgrel=1
pkgdesc='Parton distribution function interpolation library written in Python and based on the TensorFlow framework'
arch=('any')
url="https://pdfflow.readthedocs.io/"
license=('GPL3')
makedepends=("python-setuptools")
depends=("python>=3.7"
         "python-numpy"
         "python-pyaml"
         "python-tensorflow"
         )

optdepends=("python-tensorflow-cuda: GPU support"
            "lhapdf: provides PDF files in the LHAPDF format"
            "python-vegasflow: MonteCarlo library to run examples"
             )
# checkdepends=("python-pytest")
provides=("pdfflow")
changelog=
source=("https://github.com/N3PDF/pdfflow/archive/v${pkgver}.tar.gz")
md5sums=("a0a56db01b27fd71261584e316527fcb")

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
