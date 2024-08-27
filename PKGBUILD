# Maintainer: Martin Rys <rys.rs/contact>

pkgname=sc-controller
pkgver=0.4.8.20
pkgrel=1
pkgdesc='User-mode driver and GTK3 based GUI for Steam Controller'
arch=('x86_64' 'aarch64')
url='https://github.com/C0rn3j/sc-controller'
license=('GPL-2.0-only')
depends=(
	'gtk3'
	'libayatana-appindicator'
	'python-cairo'
	'python-evdev'
	'python-gobject'
	'python-pylibacl'
	'python-setuptools'
	'python-vdf'
	'xorg-xinput'
)
optdepends=('gtk-layer-shell: wayland OSD support')
conflicts=("${pkgname}-git" 'scc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/C0rn3j/sc-controller/archive/v${pkgver}.tar.gz")
sha256sums=('3d33f38e94e884987e53a725eadd0954df312505d9504720e108d6aa0e73291a')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
