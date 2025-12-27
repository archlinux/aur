# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Submitter: not_anonymous <nmlibertarian@gmail.com>

pkgname=winkeyerserial
pkgver=25.9.13.1
pkgrel=1
pkgdesc="Ham Radio - Talk to K1EL winkeyer"
url="https://pypi.org/project/winkeyerserial/"
depends=(python python-pyqt6 python-pyserial hamradio-menus)
makedepends=(python-build python-installer python-wheel)
license=(GPL-3.0-only)
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
md5sums=('59d8d8be997017fad4b75a9616116214')
sha256sums=('4dc0a6b9f76528f7c3cfcee5411b1dc76d23ff321417cfa3c792b352231f385f')
