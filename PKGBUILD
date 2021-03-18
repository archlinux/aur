# Maintainer: Martin Rys <rys.pw/#contact_me>

pkgname=sc-controller
pkgver=0.4.8.4
pkgrel=1
pkgdesc='User-mode driver and GTK3 based GUI for Steam Controller'
arch=('any')
url='https://github.com/Ryochan7/sc-controller'
license=('GPL2')
depends=('gtk3' 'python-gobject' 'python-cairo' 'python-pylibacl' 'python-evdev')
makedepends=('python-setuptools')
conflicts=("${pkgname}-git")
source=("https://github.com/Ryochan7/sc-controller/archive/v${pkgver}.tar.gz")
sha256sums=('9391e8b58a9750507acd4d59f33da062229d311a9a8fe6427f92272bb5930186')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
