# Maintainer: Groctel <aur@taxorubio.com>
pkgname=python-manimpango
_name=${pkgname#python-}
pkgver=0.1.7
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
sha256sums=('9971fc49569f55c785b49e508db85d46b3184acb0981f12d8b96b47ca535018e')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}

