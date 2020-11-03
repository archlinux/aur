
pkgname=libinput_gestures_qt
pkgver=0.3.2+7+g0868859
pkgrel=1
pkgdesc="qt-based gui app for libinput-gestures"
arch=('any')
url="https://github.com/OneAdder/libinput_gestures_qt"
license=('GPL3')
depends=('libinput-gestures' 'python-pyqt5' 'qt5-tools')
makedepends=('git' 'python-setuptools')
_commit='0868859f62e9050c33cfd55df0ffe3ac024cc45d'
source=("$pkgname::git+https://github.com/OneAdder/libinput_gestures_qt.git#commit=$_commit")
sha256sums=('SKIP')
    
pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed 's/^v.//;s/-/+/g'
}

build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
