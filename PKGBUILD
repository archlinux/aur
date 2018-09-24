# Maintainer: Tomasz Paś <kierek93@gmail.com>

pkgname=sc-controller
pkgver=0.4.5
pkgrel=1
pkgdesc='User-mode driver and GTK3 based GUI for Steam Controller'
arch=('any')
url='https://github.com/kozec/sc-controller'
license=('GPL2')
depends=('gtk3' 'python2-gobject' 'python2-cairo' 'pylibacl' 'python2-evdev')
makedepends=('python2-setuptools')
conflicts=("${pkgname}-git")
source=("https://github.com/kozec/sc-controller/archive/v${pkgver}.tar.gz")
sha256sums=('d592a049385020e17839b1cb76dcc786548f1c7f7989805c28f22de71cb8bc51')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
  	python2 setup.py build
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
