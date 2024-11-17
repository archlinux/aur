# Maintainer: MelianMiko <melianmiko@gmail.com>
pkgname=openfreebuds
pkgver=0.15.0
pkgrel=1
pkgdesc="Manager for HUAWEI FreeBuds"
arch=(any)
url="https://mmk.pw/en/openfreebuds"
license=('GPLv3')
depends=(python python-dbus-next python-psutil python-pyqt6 python-qasync python-aiohttp python-pillow)
makedepends=(python-pip python python-poetry qt6-tools)
source=("$pkgname-$pkgver::git+https://github.com/melianmiko/openfreebuds.git")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver/"
	python scripts/make.py build
}

package() {
	cd "$pkgname-$pkgver/"
	python scripts/make.py install "$pkgdir/usr" "$pkgdir/usr/lib/python3.12/site-packages"
}

