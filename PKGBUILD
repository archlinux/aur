# Maintainer: bannert <aur@bannert.dev>

pkgname=python-sudoku-engine
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple Python package that generates and solves m x n Sudoku puzzles."
arch=('any')
url="https://github.com/sepehr-rs/sudoku-engine"
license=('MIT')
depends=('python>=3.8')
makedepends=('python-build' 'python-installer')
source=("https://github.com/sepehr-rs/sudoku-engine/archive/69d95689956d5cb0cc16c3811b197932e8451815/sudoku-engine-1.0.0.tar.gz")
sha256sums=('e2d117e8ae739e9b9af28f64383bed72381a40548b7bed56e3a5b03031b7e251')

prepare() {
	cd "$srcdir/sudoku-engine-69d95689956d5cb0cc16c3811b197932e8451815"
	# No preparation steps needed for this pure Python package
}

build() {
	cd "$srcdir/sudoku-engine-69d95689956d5cb0cc16c3811b197932e8451815"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/sudoku-engine-69d95689956d5cb0cc16c3811b197932e8451815"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
