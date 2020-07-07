# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=sfd2ufo
_pkgname=sfdLib
pkgver=1.0.6
pkgrel=1
pkgdesc='An SFD to UFO converter providing sdflib'
arch=('any')
url="https://github.com/alif-type/$_pkgname"
license=('BSD')
depends=('python'
         'python-ufolib2'
         'python-fonttools')
makedepends=('python-setuptools')
provides=('python-sfdlib')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5f79b3734585c14daeba7b161ace68e90946991b6d281dc8421d096e9c063f96')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
