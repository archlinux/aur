# Maintainer: Korvin Roganov <korvinagor@vivaldi.net>

pkgname=donjon-painter
pkgver=0.9.5
pkgrel=1
pkgdesc="Graphical map translator for donjon's Random Dungeon Generator TSV files."
arch=('any')
url="https://github.com/donjon-painter/donjon-painter"
license=('GPL3')
depends=('python' 'python-setuptools' 'python-pillow')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('7d7e757e95310509cb9805e2a790e5d51fa781817b5335229188a989d037a972')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
