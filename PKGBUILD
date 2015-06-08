# Maintainer: BrainDamage
pkgname="diagram-git"
pkgver=0.2.23.r10.gc6895c1
pkgrel=1
pkgdesc="Text mode diagrams using UTF-8 characters and fancy colors"
arch=(any)
url="https://github.com/tehmaze/diagram"
license=("MIT")
depends=("python")
md5sums=("SKIP")
source=("git+https://github.com/tehmaze/diagram.git")

pkgver() {
	cd "diagram"
	git describe --tags | sed 's/^v//; s/-/.r/; s/-/./'
}

build () {
	cd "diagram"
	python setup.py build
}

package() {
	cd "diagram"
	python setup.py install --root="$pkgdir/" --prefix="/usr"
}