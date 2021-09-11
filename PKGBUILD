# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cursewords
pkgver=1.1
pkgrel=1
pkgdesc="Terminal-based crossword puzzle solver"
arch=('any')
url="https://github.com/thisisparker/cursewords"
license=('AGPL3')
depends=('python-blessed')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/cursewords/cursewords-$pkgver.tar.gz")
sha512sums=('34e3e23a6bca619ddcea74de3b5745b866b260f71f52765f93fafabd38e73a7d4e3062a63102bbab934e06c6d898649c8cd4909436cb9142ac1c51544caa1745')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
