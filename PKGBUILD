# Maintainer: Tomasz Paś <kierek93@gmail.com>

pkgname=sc-controller
pkgver=0.4.2
pkgrel=2
pkgdesc='User-mode driver and GTK3 based GUI for Steam Controller'
arch=('any')
url='https://github.com/kozec/sc-controller'
license=('GPL2')
depends=('gtk3' 'python2-gobject' 'python2-cairo' 'pylibacl' 'python2-evdev')
makedepends=('python2-setuptools')
conflicts=("${pkgname}-git")
source=("https://github.com/kozec/sc-controller/archive/v${pkgver}.tar.gz")
sha256sums=('ff714fbec121ebe020df432488ce013c1022c2a20e10b2b0edd987de2f4bedbf')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
  	python2 setup.py build
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
