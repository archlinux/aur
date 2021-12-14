# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=sfdnormalize
pkgver=0.3.0
pkgrel=2
pkgdesc='SFD normalizer, discards GUI information from SFD files'
arch=(any)
url="https://github.com/alerque/$pkgname"
license=(CCO)
depends=(python)
makedepends=(python-setuptools)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3cde95d5a75b34e2d5ed623e5106d221e7bcce0df19e50367b5a8fb89d7c9e76')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
