# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cursewords
pkgver=1.0.6
pkgrel=1
pkgdesc="Terminal-based crossword puzzle solver"
arch=('any')
url="https://github.com/thisisparker/cursewords"
license=('AGPL3')
depends=('python3'
         'python-blessed'
         'python-puzpy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/c/cursewords/cursewords-$pkgver.tar.gz")
sha512sums=('dc2b41d44aa6e6e941ee0e7d170cabeebd1091aca45f794a349f37037a7bd0f16e314be860ca8121a5a8f3ea882ca942dd3850fbf7b78eaa4ffe768cf156398c')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
