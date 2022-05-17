# Maintainer: Martin Rys <rys.pw/contact>

pkgname=sc-controller
pkgver=0.4.8.7
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
sha256sums=('af96bc2f2a90207007bc5ed00c626a1927085bb2aab7efb373e7e4339d4d11ae')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
