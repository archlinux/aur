# Maintainer: Korvin Roganov <qualimerjudith@gmail.com>

pkgname=donjon-painter
pkgver=0.9.2
pkgrel=1
pkgdesc="Graphical map translator for donjon's Random Dungeon Generator TSV files."
arch=('any')
url="https://github.com/Blackflighter/donjon-painter"
license=('GPL3')
depends=('python-pillow')
makedepends=('python')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('766edb62aab1a8d603b941d09b88e2562a0ff92617aee557801b27402b7b85fc')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
