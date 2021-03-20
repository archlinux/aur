# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=guiscrcpy
pkgver=4.10.0
pkgrel=1
pkgdesc="Open Source GUI based Android Screen Mirroring System"
arch=('any')
url="https://guiscrcpy.github.io"
license=('GPL3')
depends=('scrcpy' 'python-pynput' 'python-qtpy' 'python-psutil'
         'python-cairosvg' 'python-click' 'python-colorama' 'libxinerama')
makedepends=('git' 'python-setuptools' 'python-pyqt5')
optdepends=('python-pyqt5: Qt5 Python bindings'
            'pyside2: PySide Qt5 Python bindings'
            'usbaudio: audio mirroring for Android <8.0'
            'sndcpy: audio mirroring for Android >=10')
_commit=c2055ee29d3d6d143b5566c0c127a3188f0af9c7  # tags/v4.10.0^0
source=("git+https://github.com/srevinsaju/guiscrcpy.git#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('7427D25413635E1E39657B6B1007816766D390D7')
              # Srevin Saju (srevinsaju) <srevinsaju@sugarlabs.org>

pkgver() {
	cd "$srcdir/$pkgname"
	python setup.py --version
}

build() {
	cd "$srcdir/$pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
