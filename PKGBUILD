# Maintainer: Groctel <aur@taxorubio.com>
pkgname=python-manimpango
_name=ManimPango
pkgver=0.2.4
pkgrel=1
pkgdesc="C binding for Pango using Cython used in Manim to render (non-LaTeX) text."
arch=('any')
url="https://manimpango.manim.community"
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
sha512sums=('a40b9b71264e8988afb18559e9a99fd0207af982a7c1c6976a52773d3de3c66282aaa549168350370868dc4941f63ff986574d3dcc32ed0e4423f3dd5bc88e8c')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}

