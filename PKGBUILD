# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>
_pkgname=kiwi
pkgname=python-stoq-kiwi
pkgver=3.0.2
pkgrel=1
pkgdesc="A graphical framework to construct simple UI"
arch=('any')
url="https://github.com/stoq/${_pkgname}"
license=('LGPL')
depends=('python' 'python-setuptools' 'python-zope-interface' 'python-gobject' 'gtk3')
conflicts=('stoq-server<=0.14.1' 'stoq<=2.2' 'stoqdrivers<=1.3.3' 'kiwi')
makedepends=('git')
source=("https://launchpad.net/~stoq-dev/+archive/ubuntu/stoq3/+sourcefiles/${_pkgname}/${pkgver}-2bionic/${_pkgname}_${pkgver}-2bionic.tar.gz")
md5sums=('b5db443448d3499c292ef42a80e9c2fc')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
