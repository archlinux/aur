# Maintainer: Juliette Monsel <j_4321@protonmail.com>
pkgname=sudoku-tk
_name=Sudoku-Tk
pkgver=1.2.1
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
sha512sums=('2b2ff74e3386d72ac5193cd4395363998e413b166e452e5aade845dccfefb8bdbb96ca7c9a615cc50c83888ec89745600b6963558076aaba0fce418793b09bc6')

build() {
	cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
