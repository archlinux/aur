# Maintainer: Juliette Monsel <j_4321@protonmail.com>
pkgname=sudoku-tk
_name=Sudoku-Tk
pkgver=1.2.0
pkgrel=1
pkgdesc="Sudoku games and puzzle solver written in Python"
arch=('any')
url="https://github.com/j4321/Sudoku-Tk"
license=('GPL3')
makedepends=('python-setuptools')
depends=('tk' 'python-pillow' 'python-numpy' 'gettext' 'desktop-file-utils')
optdepends=('python-tkfilebrowser: nicer file browser'
            'zenity: nicer file browser')
source=("$pkgname-$pkgver.tar.gz::https://github.com/j4321/$_name/archive/v$pkgver.tar.gz")
sha512sums=('66c246219b690ec56c34c663ffef463a4ebe8d273e5309126f337e330a56cf1b63f1e2c7dfb4c2ff5237c1c1a077a80ee379e8a972d3564be497030d14f866a4')

build() {
	cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
