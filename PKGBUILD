# Maintainer: Nico Rittstieg <nico.rittstieg@gmx.de>
pkgname=savedesktop
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI tool for saving and restoring virtual linux desktops"
arch=('x86_64')
url="https://github.com/nrittsti/savedesktop"
license=('GPLv3')
makedepends=('python-setuptools')
depends=('python' 'wmctrl' 'xorg-xwininfo' 'xdotool' 'yad' 'zenity')
source=("https://github.com/nrittsti/savedesktop/archive/v0.1.0.tar.gz")
md5sums=('4c478ec3887b9f048710edaffed1aa9c')

build() {
	cd "${srcdir}/${pkgbase}-${pkgver}"
	/usr/bin/python3 setup.py build
}

package() {
	cd "${srcdir}/${pkgbase}-${pkgver}"
	/usr/bin/python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
