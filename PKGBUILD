# Maintainer: Korvin Roganov <korvinagor@vivaldi.net>

pkgname=donjon-painter
pkgver=0.9.3
pkgrel=1
pkgdesc="Graphical map translator for donjon's Random Dungeon Generator TSV files."
arch=('any')
url="https://github.com/Blackflighter/donjon-painter"
license=('GPL3')
depends=('python-pillow')
makedepends=('python')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('0ce7bb6e9ef47c799e74b1d9a00287b1cc7b13c9028b241a3a7ffbe143e04235')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
