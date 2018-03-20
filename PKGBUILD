# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>
pkgname=stoqdrivers
pkgver=1.3.3
pkgrel=1
pkgdesc="Python fiscal printer (ECF) drivers"
arch=('x86_64')
url="https://github.com/stoq/${pkgname}"
license=('LGPL')
depends=('python2' 'kiwi' 'python2-pyserial' 'python2-pyusb' 'python2-zope-interface' 'python2-qrcode' 'python2-setuptools' 'python2-six')
makedepends=('git')
conflicts=('stoqdrivers-git')
source=("https://github.com/stoq/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('4271939ff8903d63baa6d76cfa4f6546')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
