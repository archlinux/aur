# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=slice
pkgver=0.7.1
pkgrel=2
pkgdesc='GUI app to generate custom static fonts from variable fonts'
arch=(any)
url="https://github.com/source-foundry/${pkgname^}"
license=(GPL3)
_pydeps=(brotli
         fonttools
         pyqt5
         zopfli)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-setuptools)
_archive="${pkgname^}-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d844bc59256108480568c4bd5bcf95e88bda4695183232cfd0d1be11a3379318')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
