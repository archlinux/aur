
pkgname=libinput_gestures_qt
pkgver=0.4
pkgrel=2
pkgdesc="qt-based gui app for libinput-gestures"
arch=('any')
url="https://github.com/OneAdder/libinput_gestures_qt"
license=('GPL3')
depends=('libinput-gestures' 'python-pyqt5' 'qt5-tools')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OneAdder/libinput_gestures_qt/archive/v.$pkgver.tar.gz")
sha256sums=('7f7e0a65c506b917ffccbe9586e3b6dcd24ce536c382d43105eb436958476cbd')
            
build() {
	cd "$pkgname-v.$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-v.$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
