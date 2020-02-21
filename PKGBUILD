# Maintainer: Omar Sandoval <osandov at osandov dot com>

pkgname=drgn
pkgver=0.0.3
pkgrel=1
pkgdesc='Scriptable debugger library'
arch=('x86_64')
url='https://github.com/osandov/drgn'
license=('GPL3')
depends=('bzip2' 'libkdumpfile' 'python' 'python-setuptools' 'xz' 'zlib')
makedepends=('gawk')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('986477ee3d381ee8280e018644c8c3874e49e716f1487557f9fd28c30f78793b')

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
