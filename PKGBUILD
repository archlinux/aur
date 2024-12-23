# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=sfd2ufo
_pkgname=sfdLib.py
pkgver=1.2.5
pkgrel=3
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
sha256sums=('c39ffb59a62e0cce2d5acdd11151642ee7f30a584ec0135a5de49678708ad3a0')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
