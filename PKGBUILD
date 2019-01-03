# Maintainer: Nico Rittstieg <nico.rittstieg@gmx.de>
pkgname=savedesktop
pkgver=0.1.1
pkgrel=1
pkgdesc="CLI tool for saving and restoring virtual linux desktops"
arch=('x86_64')
url="https://github.com/nrittsti/savedesktop"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python' 'wmctrl' 'xorg-xwininfo' 'xdotool' 'gtk3' 'python-gobject')
source=("https://github.com/nrittsti/savedesktop/archive/v${pkgver}.tar.gz")
md5sums=('684e81f29122f8c5521dc29ff0e0afa4')

build() {
	cd "${srcdir}/${pkgbase}-${pkgver}"
	/usr/bin/python3 setup.py build
}

package() {
	cd "${srcdir}/${pkgbase}-${pkgver}"
	/usr/bin/python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
