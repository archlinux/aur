# Maintainer: Martin Rys <rys.pw/#contact_me>

pkgname=sc-controller
pkgver=0.4.8.2
pkgrel=2
pkgdesc='User-mode driver and GTK3 based GUI for Steam Controller'
arch=('any')
url='https://github.com/Ryochan7/sc-controller'
license=('GPL2')
depends=('gtk3' 'python-gobject' 'python-cairo' 'python-pylibacl' 'python-evdev')
makedepends=('python-setuptools')
conflicts=("${pkgname}-git")
source=("https://github.com/Ryochan7/sc-controller/archive/v${pkgver}.tar.gz")
sha256sums=('be515560da16e252f111c27d7fc936661ab12efcd1dd80b882b453007a5f5207')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
