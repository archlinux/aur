# Maintainer: Martin Rys <rys.pw/contact>

pkgname=sc-controller
pkgver=0.4.8.10
pkgrel=1
pkgdesc='User-mode driver and GTK3 based GUI for Steam Controller'
arch=('any')
url='https://github.com/Ryochan7/sc-controller'
license=('GPL2')
depends=('gtk3' 'python-gobject' 'python-cairo' 'python-pylibacl' 'python-evdev' 'xorg-xinput')
optdepends=('gtk-layer-shell: wayland OSD support')
makedepends=('python-setuptools')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Ryochan7/sc-controller/archive/v${pkgver}.tar.gz")
sha256sums=('1f55e89a441e911d98d534a5f29deb5f133cdfa4593fd85238356cf6cc781312')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
