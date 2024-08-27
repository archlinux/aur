# Maintainer: Martin Rys <rys.rs/contact>

pkgname=sc-controller
pkgver=0.4.8.19
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
sha256sums=('1f0bbaa0dc9d335bc0ab928bbb7d4497df0ebfba33a591c35e2e8a81ebeaa7d8')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
