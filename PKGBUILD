# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-ufo-extractor
_pipname=${pkgname#python-}
_upname=${_pipname#ufo-}
pkgver=0.3.0
pkgrel=1
pkgdesc='Tools for extracting data from font binaries into UFO objects'
url="https://github.com/robotools/$_upname"
arch=('any')
license=('MIT')
depends=('python' 'python-fonttools')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('30df4b5580edcc117ac3fcd877a3d9f2000d41567f9cd787be086057e4b4d476')

build() {
	cd "$_upname-$pkgver"
	python setup.py build
}

check() {
    cd "$_upname-$pkgver"
	python setup.py test
}

package() {
    cd "$_upname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
