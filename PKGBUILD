# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Jelle van der Waa <jelle@archlinux.org>

pkgname=mpy-utils
pkgver=0.1.11
pkgrel=1
pkgdesc="Utility programs for Micropython"
arch=('any')
url="https://github.com/nickzoic/mpy-utils"
license=('MIT')
depends=('python' 'python-pyserial' 'python-fusepy')
makedepends=('python-setuptools')
#source=("$pkgname-$pkgver.tar.gz::https://github.com/nickzoic/mpy-utils/archive/v0.1.5.tar.gz")
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('1942fe0fd76037305783cb9e5ad50bf73ba8aa63f2ccbef15b0c636acf5c6799')


build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
