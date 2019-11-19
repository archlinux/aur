# Maintainer: Vinicius Correa <vinicius.correa at zoho dot com>
_pkgname=stoqdrivers
pkgname=python-stoqdrivers
pkgver=1.6.2
pkgrel=1
pkgdesc="Python fiscal printer (ECF) drivers"
arch=('any')
url="https://www.stoq.com.br"
license=('LGPL')
depends=('python' 'python-pyserial' 'python-pyusb' 'python-zope-interface' 'python-qrcode')
conflicts=('stoqdrivers')
source=("https://pypi.python.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('e3002937558bfd0c81660a2e11ef6545')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
