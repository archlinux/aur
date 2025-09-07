# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=python-x2go
pkgver=0.6.1.4
pkgrel=1
pkgdesc="Python module providing X2Go client API"
url="http://www.x2go.org/"
arch=('any')
license=('AGPL')
makedepends=('python-setuptools')
depends=('python-gevent' 'python-paramiko' 'python-requests'
         'python-simplejson' 'python-xlib' 'nxproxy')
source=("http://code.x2go.org/releases/source/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d1a8b4ebf66ab372dda74a90cbdc9bfd85be7219bdbea12abcb8a0569114e9f2')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

