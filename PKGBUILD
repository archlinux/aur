# Maintainer: monosans <hsyqixco at protonmail dot com>
pkgname=autotiling-columns-git
_pkgname=autotiling-columns
pkgver=r89.49724a9
pkgrel=1
pkgdesc="Script for sway and i3 to set the maximum amount of columns"
arch=(x86_64)
url="https://github.com/monosans/autotiling-columns"
license=(GPL3)
depends=(python-i3ipc)
makedepends=(git python-setuptools)
source=(git://github.com/monosans/autotiling-columns.git)
sha256sums=('SKIP')
provides=(autotiling-columns)
conflicts=(autotiling-columns)

pkgver() {
	cd "$_pkgname"
	echo r"$(git rev-list --count HEAD)"."$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname"
	python setup.py install --root="${pkgdir}" --optimize=1
}
