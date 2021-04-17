# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=sfd2ufo
_pkgname=sfdLib
pkgver=1.2.1
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
sha256sums=('b4500e61f3714c762cb03f164823b5ea921b8e462a2a480a98f7a1cfb9a06ef4')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
