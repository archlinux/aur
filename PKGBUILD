# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cursewords
pkgver=1.0.9
pkgrel=1
pkgdesc="Terminal-based crossword puzzle solver"
arch=('any')
url="https://github.com/thisisparker/cursewords"
license=('AGPL3')
depends=('python3' 'python-blessed' 'python-puzpy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/c/cursewords/cursewords-$pkgver.tar.gz")
sha512sums=('5b5d59c91ac74fb869a11bfb1857f9d544be55fd3135722e7dc7d9df5093e78d92d6ba356a2f39d1a202e579dc687092ed5db4288826982f792e1417f6d0f1f8')

build() {
	export PYTHONHASHSEED=0
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
