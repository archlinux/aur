# Maintainer: Korvin Roganov <korvinagor@vivaldi.net>

pkgname=donjon-painter
pkgver=0.9.4
pkgrel=1
pkgdesc="Graphical map translator for donjon's Random Dungeon Generator TSV files."
arch=('any')
url="https://github.com/Blackflighter/donjon-painter"
license=('GPL3')
depends=('python-pillow')
makedepends=('python')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b7a5f830a897384fa5d95efc44375a2cc711f92887c28e1ea1f9c7fc62e62292')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
