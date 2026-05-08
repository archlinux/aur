# Maintainer: Hownioni <honeyhownioni at gmail dot com>
pkgname=win2xcur
pkgver=0.2.1
pkgrel=1
pkgdesc="Convert Windows cursors to Xcursor format and visceversa"
arch=(any)
url="https://github.com/quantum5/win2xcur"
license=('GPL-3.0-or-later')
depends=("python-numpy" "python-wand")
makedepends=("python-build" "python-installer" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/quantum5/win2xcur/archive/refs/tags/v$pkgver.tar.gz")
md5sums=(SKIP)

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
