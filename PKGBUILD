# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
pkgname=python-rclone-python
_pkgname=${pkgname#python-}
_name=rclone_python
pkgver=0.1.24
pkgrel=1
pkgdesc="A python wrapper for rclone."
arch=('any')
url="https://github.com/Johannes11833/rclone_python"
license=('MIT')
depends=(python python-rich rclone)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$_name-$pkgver.tar.gz::https://github.com/Johannes11833/rclone_python/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5b5ca7b905ba787ba589a88d10b77bef4c0cbc864520cb2e2be428a9a56f97c3')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
