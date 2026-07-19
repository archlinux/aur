# Maintainer: Agil Mammadov <mammadovagil@proton.me>
pkgname=python-rclone-python
_pkgname=${pkgname#python-}
_name=rclone_python
pkgver=0.1.25
pkgrel=1
pkgdesc="A python wrapper for rclone."
arch=('any')
url="https://github.com/Johannes11833/rclone_python"
license=('MIT')
depends=(python python-rich rclone)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$_name-$pkgver.tar.gz::https://github.com/Johannes11833/rclone_python/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f7866e59af1e6b8a85779679a4deb4f7ecbfb697db92964f87bcd2ac5d67e78b')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
