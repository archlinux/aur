# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=dehinter
pkgver=4.0.0
pkgrel=1
pkgdesc='A tool for the removal of TrueType instruction sets (hints) in fonts'
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=('MIT')
depends=('python' 'python-fonttools>=4.22.1')
makedepends=('python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c7fd270fdd6d1b67326c1af61a3497eb86974567aff7e96ebee836d81fa56769')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
