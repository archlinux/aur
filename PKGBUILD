# Maintainer: Thermionix

pkgname=pactray
pkgver=1.1
pkgrel=1
pkgdesc="Pacman tray notifier."
arch=('any')
license=('GPL')
url="https://github.com/Thermionix/pactray"
depends=('pacman' 'python-gobject')
optdepends=('auracle: check aur packages')
source=("$pkgname"::'git+https://github.com/Thermionix/pactray.git#commit=6ab596f5dae85cdb27fabe1263e3c1df80af5a32')
md5sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"
	python setup.py clean
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}"
	python setup.py install --prefix=${pkgdir}/usr
}
