# Maintainer: Tomasz Paś <kierek93@gmail.com>

pkgname=sc-controller
pkgver=0.3.9
pkgrel=1
pkgdesc='User-mode driver and GTK3 based GUI for Steam Controller'
arch=('any')
url='https://github.com/kozec/sc-controller'
license=('GPL2')
depends=('gtk3' 'python2-gobject' 'python2-cairo' 'pylibacl')
makedepends=('python2-setuptools')
conflicts=("${pkgname}-git")
source=("https://github.com/kozec/sc-controller/archive/v${pkgver}.tar.gz")
sha256sums=('774f59dd14ddd7b49f8a863f7dd731d4263f22d340e1f0b49a3cb647d5083b84')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
  	python2 setup.py build
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
