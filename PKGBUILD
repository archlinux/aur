# Maintainer: MelianMiko <melianmiko@gmail.com>
pkgname=openfreebuds
pkgver=0.17.3
pkgrel=1
pkgdesc="Manager for HUAWEI FreeBuds"
arch=(any)
url="https://mmk.pw/en/openfreebuds"
license=('GPLv3')
depends=(python python-dbus-next python-psutil python-pyqt6 python-qasync python-aiohttp python-pillow)
makedepends=(python-pip python python-pdm qt6-tools just)
source=("$pkgname-$pkgver::git+https://github.com/melianmiko/openfreebuds.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver/"
	just build
}

package() {
	cd "$pkgname-$pkgver/"
	PYVER=`python -c 'import platform; print(".".join(platform.python_version().split(".")[0:2]))'`
	DESTDIR="$pkgdir/usr" PYTHONLIBDIR="$pkgdir/usr/lib/python$PYVER/site-packages" just install
}

