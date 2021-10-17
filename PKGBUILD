# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=blacktex
pkgver=0.5.2
pkgrel=1
pkgdesc="LaTex code prettifier and formatter"
arch=('any')
url="https://github.com/nschloe/blacktex"
license=('GPL3')
depends=('python>=3.6')
optdepends=('python-importlib_metadata: required for python<3.8')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('1a0660ea8438ae7c640977a19b5b2c326a3555d0af2e32eb06e67758a4f0d40a')

build() {
	cd "$pkgname-$pkgver"
	python -c 'from setuptools import setup; setup()' build
}

package() {
	cd "$pkgname-$pkgver"
	python -c 'from setuptools import setup; setup()' install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
