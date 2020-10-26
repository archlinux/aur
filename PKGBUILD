# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=dehinter
pkgver=2.0.3
pkgrel=1
pkgdesc='A tool for the removal of TrueType instruction sets (hints) in fonts'
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=('MIT')
depends=('python' 'python-fonttools')
makedepends=('python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a1b15a280c0e56c2aa27e8c6b61924c21e5dee5745d508dd2d02ca7c368c83bb')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
