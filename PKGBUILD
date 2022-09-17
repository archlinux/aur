pkgname=python-tsp-solver2-git
_pkgname="python-tsp-solver2"
pkgdesc="Travelling Salesman Problem solver in pure Python + some visualizers"
pkgver=0.4.1.e743b7c
pkgrel=1
arch=('i686' 'x86_64')
conflicts=($_pkgname)
provides=($_pkgname)
url="https://github.com/dmishin/tsp-solver2"
license=('Unlicense')
depends=("python")
optdepends=()
makedepends=('git' 'python')
source=("$_pkgname::git+https://github.com/dmishin/tsp-solver.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "%s.%s" "$(python setup.py --version)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $_pkgname
	python setup.py install --root="$pkgdir/"  --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
