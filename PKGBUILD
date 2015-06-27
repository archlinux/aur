# Maintainer: lucy <lucy@luz.lu>

pkgname=python-ftfy-git
_gitname=python-ftfy
pkgver=r194.7f025a2
pkgrel=1
pkgdesc='Fixes some problems with Unicode text after the fact'
url="https://github.com/LuminosoInsight/python-ftfy"
arch=('any')
license=('MIT')
makedepends=('python' 'python-setuptools')
depends=('python')
source=('git+https://github.com/LuminosoInsight/python-ftfy.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"
	python setup.py build
}

package() {
	cd "$srcdir/$_gitname"
	python setup.py install --prefix=/usr --root="$pkgdir"
	install -Dm644 LICENSE.txt \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
