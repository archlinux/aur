# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>
_pkgname=stoqdrivers
pkgname=python-stoqdrivers
pkgver=1.4.2
pkgrel=1
pkgdesc="Python fiscal printer (ECF) drivers"
arch=('any')
url="https://github.com/stoq/${_pkgname}"
license=('LGPL')
depends=('python' 'python-stoq-kiwi' 'python-pyserial' 'python-pyusb' 'python-zope-interface' 'python-qrcode')
makedepends=('git')
conflicts=('stoqdrivers')
source=("https://launchpad.net/~stoq-dev/+archive/ubuntu/stoq3/+sourcefiles/${_pkgname}/${pkgver}-1bionic/${_pkgname}_${pkgver}-1bionic.tar.gz")
md5sums=('9b960a933af33c878b29c4b7946b7f89')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
