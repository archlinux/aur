# Maintainer: Jameson Pugh <imntreal@gmail.com>
pkgname=python-systemd
pkgver=230
pkgrel=1
pkgdesc="Python bindings for systemd"
arch=('x86_64' 'i686')
url="http://www.freedesktop.org/wiki/Software/systemd/"
license=('GPL')
depends=('python' 'python-lxml' 'systemd')
makedepends=('python-setuptools')
source=("https://github.com/systemd/python-systemd/archive/v${pkgver}.tar.gz")
sha256sums=('656a83ff695f5de7d63411a86ea38601ad5a918595eebd0817d7b8e68642c64d')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  make
  python setup.py build
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
