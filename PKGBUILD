# Maintainer: Martin Rys <rys.rs/contact>

pkgname=sc-controller
pkgver=0.4.8.18
pkgrel=1
pkgdesc='User-mode driver and GTK3 based GUI for Steam Controller'
arch=('x86_64' 'aarch64')
url='https://github.com/C0rn3j/sc-controller'
license=('GPL-2.0-only')
depends=('gtk3' 'libayatana-appindicator' 'python-gobject' 'python-cairo' 'python-pylibacl' 'python-evdev' 'python-vdf' 'xorg-xinput')
optdepends=('gtk-layer-shell: wayland OSD support')
makedepends=('python-setuptools')
conflicts=("${pkgname}-git" 'scc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/C0rn3j/sc-controller/archive/v${pkgver}.tar.gz")
sha256sums=('de81cdd390299fe0182ed931f4568f0032ec41973daf5148f596dafa8ff6afb4')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
