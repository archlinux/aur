# Maintainer: Martin Rys <rys.pw/contact>

pkgname=sc-controller
pkgver=0.4.8.13
pkgrel=1
pkgdesc='User-mode driver and GTK3 based GUI for Steam Controller'
arch=('x86_64' 'aarch64')
url='https://github.com/Ryochan7/sc-controller'
license=('GPL-2.0-only')
depends=('gtk3' 'python-gobject' 'python-cairo' 'python-pylibacl' 'python-evdev' 'python-vdf' 'xorg-xinput')
optdepends=('gtk-layer-shell: wayland OSD support')
makedepends=('python-setuptools')
conflicts=("${pkgname}-git" 'scc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Ryochan7/sc-controller/archive/v${pkgver}.tar.gz")
sha256sums=('6abd212b1168cbf7008623a447c12ad57c56d7cf876cc57cf51f8f9f54852798')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
