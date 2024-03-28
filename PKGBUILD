# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=sfd2ufo
_pkgname=sfdLib.py
pkgver=1.2.2
pkgrel=1
pkgdesc='An SFD to UFO converter providing sdflib'
arch=(any)
url="https://github.com/MFEK/$_pkgname"
license=(BSD-3-Clause)
depends=(python
         python-ufolib2
         python-fonttools)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
provides=(python-sfdlib)
options=(!emptydirs)
_archive="$_pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('5953cba813144d63f8e1227502faed8e936359cddc18a58bb4b7dd15ba96fcd3')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
