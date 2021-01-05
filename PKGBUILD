# Maintainer: Groctel <aur@taxorubio.com>
pkgbase=python-manimpango
pkgname=manimpango
pkgver=0.1.4
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
)
provides=()
source=("https://github.com/ManimCommunity/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('693fbc52ea60c75acb9c98f23fc8e98a429b5ce02ab761ef9db24e9d61d62a49')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
