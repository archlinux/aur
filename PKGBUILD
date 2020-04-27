# Maintainer: Omar Sandoval <osandov at osandov dot com>

pkgname=drgn
pkgver=0.0.4
pkgrel=1
pkgdesc='Scriptable debugger library'
arch=('x86_64')
url='https://github.com/osandov/drgn'
license=('GPL3')
depends=('bzip2' 'libkdumpfile' 'python' 'python-setuptools' 'xz' 'zlib')
makedepends=('gawk')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('845d30a8944f367f3277f55ae3c9058ef42d8146dc5a105410dd81481f968797')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	python setup.py test
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
