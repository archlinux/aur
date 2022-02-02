# Maintainer: Martin Rys <rys.pw/#contact_me>

pkgname=sc-controller
pkgver=0.4.8.5
pkgrel=2
pkgdesc='User-mode driver and GTK3 based GUI for Steam Controller'
arch=('any')
url='https://github.com/Ryochan7/sc-controller'
license=('GPL2')
depends=('gtk3' 'python-gobject' 'python-cairo' 'python-pylibacl' 'python-evdev' 'xorg-xinput')
optdepends=('gtk-layer-shell: wayland OSD support')
makedepends=('python-setuptools')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Ryochan7/sc-controller/archive/v${pkgver}.tar.gz")
sha256sums=('37448eb570edd894d75eb9531e592fbc68ceb8af775d7cd6e1c73abb02381be3')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
