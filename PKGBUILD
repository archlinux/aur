# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=pyinstaller-hooks-contrib
pkgver=2020.10
pkgrel=1
pkgdesc="Community maintained hooks for PyInstaller"
arch=('any')
url="https://github.com/pyinstaller/pyinstaller-hooks-contrib"
license=('GPL' 'APACHE')
depends=('towncrier' 'python-setuptools' 'python-wheel' 'twine')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('bf4543a16c9c6e9dd2d70ea3fee78b81d3357a68f706df471d990213892259d9')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
