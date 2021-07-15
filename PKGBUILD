# Maintainer: MelianMiko <mikigaru@zohomail.com>
pkgname=mibandpreview-git
pkgver=0.7.4
pkgrel=1
pkgdesc="Simple preview tool for Mi Band 4-6 watchfaces"
arch=(any)
url="https://melianmiko.ru/mibandpreview"
license=('Apache')
depends=(python-certifi python-pillow python python-pyqt5)
makedepends=(make qt5-tools python-setuptools)
source=("$pkgname-$pkgver::git+https://github.com/melianmiko/mibandpreview.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	python3 setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	mkdir -p $pkgdir/usr/share/icons/hicolor/96x96/apps
	mkdir -p $pkgdir/usr/share/applications
	cp mibandpreview_qt/res/mibandpreview-qt.png $pkgdir/usr/share/icons/hicolor/96x96/apps
	cp mibandpreview_qt/res/mibandpreview-qt.desktop $pkgdir/usr/share/applications
}

