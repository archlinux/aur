# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

pkgname=python-uqbar
pkgver=0.5.6
pkgrel=1
pkgdesc='Tools for building documentation with Sphinx, Graphviz and LaTeX'
arch=('any')
url="https://github.com/josiah-wolf-oberholtzer/uqbar"
license=('MIT')
depends=(
	'python>=3.7'
	'python-sphinx>=3.2.0'
	'python-unidecode>=1.0.0'
	'python-black'
	'python-sphinx_rtd_theme>=0.5.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a86946b57215ad903b989f07661b240c507fb327807c389ed89855bfddef13f0')

build() {
	cd "uqbar-$pkgver"
	python setup.py build
}

package() {
	cd "uqbar-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
