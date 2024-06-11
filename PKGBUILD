# Maintainer: Martin Rys <rys.rs/contact>

pkgname=sc-controller
pkgver=0.4.8.15
pkgrel=1
pkgdesc='User-mode driver and GTK3 based GUI for Steam Controller'
arch=('x86_64' 'aarch64')
url='https://github.com/C0rn3j/sc-controller'
license=('GPL-2.0-only')
depends=('gtk3' 'python-gobject' 'python-cairo' 'python-pylibacl' 'python-evdev' 'python-vdf' 'xorg-xinput')
optdepends=('gtk-layer-shell: wayland OSD support')
makedepends=('python-setuptools')
conflicts=("${pkgname}-git" 'scc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/C0rn3j/sc-controller/archive/v${pkgver}.tar.gz")
sha256sums=('078f5672a56f8d760a6dff9d9f141a6d4fcc30a2de8b544c968fe80f38b7bb46')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
