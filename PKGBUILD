# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Submitter: not_anonymous <nmlibertarian@gmail.com>

pkgname=winkeyerserial
pkgver=24.1.23
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
md5sums=('3f4f920b975c3aaaa3bbb3a16d4a8620')
sha256sums=('9374c5bfe8ed945742a1d75ce66f09a40f2b0f5aa3b433b142de168a8c6f277a')
