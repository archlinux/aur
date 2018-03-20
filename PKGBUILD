# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>
pkgname=stoq-server
pkgver=0.14.1
pkgrel=1
pkgdesc="Stoq server."
arch=('x86_64')
url="https://github.com/stoq/${pkgname}"
license=('LGPL')
depends=('python2' 'python2-twisted' 'python2-requests' 'python2-netifaces')
makedepends=('git' 'kiwi' 'stoqdrivers' 'stoq')
conflicts=('stoq-server-git')
source=("https://github.com/stoq/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('a7689059dcd43d74da5c6a8a20184129')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
