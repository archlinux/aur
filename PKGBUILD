# Maintainer: MGislv <nocentinigabriele91@gmail.com>

_commit=b7ab941531b2b29940c8508c210dd306dcdf9256
pkgname=python-pafx
pkgver=r11.b7ab941
pkgrel=1
pkgdesc="Pixel Art effects for PIL"
arch=('any')
license=('Apache')
url="https://github.com/agateau/pafx"
depends=('python-pillow')
makedepends=('python-setuptools' 'git')
source=("git+https://github.com/agateau/pafx.git#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
	cd pafx
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd pafx
	python setup.py build
}

package() {
	cd pafx
	python setup.py install --root="$pkgdir" --optimize=1
}
