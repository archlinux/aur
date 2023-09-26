# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Submitter: not_anonymous <nmlibertarian@gmail.com>

pkgname=winkeyerserial
pkgver=23.5.28
pkgrel=1
pkgdesc="Ham Radio - Talk to K1EL winkeyer"
url="https://pypi.org/project/winkeyerserial/"
depends=(python python-pyqt5 python-pyserial hamradio-menus)
makedepends=(python-build python-installer python-wheel)
license=(GPL)
arch=(any)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname/-/_}-$pkgver.tar.gz")
#	"$pkgname.1")

build() {
	cd $srcdir/$pkgname-$pkgver

	python -m build --wheel --no-isolation
}

package() {
	cd $srcdir/$pkgname-$pkgver

	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm755 $pkgname/k6gte-$pkgname.desktop $pkgdir/usr/share/applications/k6gte-$pkgname.desktop
	install -Dm755 $pkgname/k6gte-$pkgname-128.png $pkgdir/usr/share/pixmaps/k6gte-$pkgname.png
}
md5sums=('a48f3b1166cda9af16e6b736acb521e6')
sha256sums=('c8901929314a94603a63b74aef1d9e5a94a8edebff1bf1f161d63b9481596d03')
