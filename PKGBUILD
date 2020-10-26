# Maintainer: Martin Rys <rys.pw/#contact_me>

pkgname=sc-controller
pkgver=0.4.8.1
pkgrel=1
pkgdesc='User-mode driver and GTK3 based GUI for Steam Controller'
arch=('any')
url='https://github.com/Ryochan7/sc-controller'
license=('GPL2')
depends=('gtk3' 'python-gobject' 'python-cairo' 'python-pylibacl' 'python-evdev')
makedepends=('python-setuptools')
conflicts=("${pkgname}-git")
source=("https://github.com/Ryochan7/sc-controller/archive/v${pkgver}.tar.gz")
sha256sums=('920738a15e430d79e2f85f08f4ab3a0b3bcb0cf916be858db38d432377b0534f')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
