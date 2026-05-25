# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
pkgname=python-rclone
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
provides=(python-rclone python-rclone-python)
conflicts=(python-rclone python-rclone-python)
source=("$_name-$pkgver.tar.gz::https://github.com/Johannes11833/rclone_python/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d6d606112121417ed6427eaf489c02ea80240d9cfda8979e37a6ffab5183c012')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
