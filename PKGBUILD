# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=sfd2ufo
_pkgname=sfdLib
pkgver=1.0.0
pkgrel=3
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
sha256sums=('a41d8a96ac69bd4fd434e3607bc442eb0cbee2af2e407f65efc307f31491852b')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
