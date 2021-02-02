# Maintainer: Groctel <aur@taxorubio.com>
pkgname=python-manimpango
_name=${pkgname#python-}
pkgver=0.2.0
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
sha256sums=('78C827856932B51D7FDA30C2C7DBB30431310C38E58A951925DB94E9721DF558')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}

