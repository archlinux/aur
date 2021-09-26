# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=python-x2go
pkgver=0.6.1.3
pkgrel=2
pkgdesc="Python module providing X2Go client API"
url="http://www.x2go.org/"
arch=('any')
license=('AGPL')
makedepends=('python-setuptools')
depends=('python-gevent' 'python-paramiko' 'python-requests'
         'python-simplejson' 'python-xlib' 'nxproxy')
source=("http://code.x2go.org/releases/source/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('08b951b434ba3b0e232fc5d01ab07c4b1d9c0e8d16af9722f78f52dd271a09f8')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

