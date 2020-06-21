# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=sfd2ufo
_pkgname=sfdLib
pkgver=1.0.4
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
sha256sums=('42a19d0eb8bc0cc81df387a3cc763faaae2c2bcd9c25ff0e228e500037268e2c')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
