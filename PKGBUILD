# Maintainer: Groctel <aur@taxorubio.com>
pkgname=python-manimpango
_name=${pkgname#python-}
pkgver=0.1.6
pkgrel=1
pkgdesc="C binding for Pango using Cython used in Manim to render (non-LaTeX) text."
arch=('any')
url="https://github.com/ManimCommunity/manimpango/"
license=('GPL3')
depends=(
	'pango'
	'python'
)
makedepends=(
	'python-setuptools'
	'cython'
)
provides=()
source=("https://github.com/ManimCommunity/$_name/releases/download/v$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('BBB4668E2E718DA425CAB183FE58B78EFFE146D792D342D8D24826881542DAD5')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}

