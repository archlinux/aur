# Maintainer: Thermionix

pkgname=pactray
pkgver=1.0
pkgrel=1
pkgdesc="Pacman tray notifier."
arch=('any')
license=('GPL')
url="https://github.com/Thermionix/pactray"
depends=('pacman' 'python-gobject')
optdepends=('cower: check aur packages')
source=("$pkgname"::'git+https://github.com/Thermionix/pactray.git')
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
