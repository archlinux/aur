# Maintainer: Tomasz Paś <kierek93@gmail.com>

pkgname=sc-controller
pkgver=0.3.12
pkgrel=1
pkgdesc='User-mode driver and GTK3 based GUI for Steam Controller'
arch=('any')
url='https://github.com/kozec/sc-controller'
license=('GPL2')
depends=('gtk3' 'python2-gobject' 'python2-cairo' 'pylibacl')
makedepends=('python2-setuptools')
conflicts=("${pkgname}-git")
source=("https://github.com/kozec/sc-controller/archive/v${pkgver}.tar.gz")
sha256sums=('8d103f923214787178efeebf7b4dbc2dfc165cb63a7844cd6ca919c77fb64b58')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
  	python2 setup.py build
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
