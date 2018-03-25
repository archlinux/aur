# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>
# Contributor: Mariel de Jesus™ <marieldejesus12@gmail.com>
pkgname=stoq-server
pkgver=0.14.1
pkgrel=3
pkgdesc="Stoq server."
arch=('any')
url="https://github.com/stoq/${pkgname}"
license=('LGPL')
depends=('python2' 'kiwi' 'stoqdrivers' 'stoq' 'python2-twisted' 'python2-requests' 'python2-netifaces'
 'binutils' 'supervisor' 'duplicity' 'openvpn' 'postgresql' 'openssh'
 'avahi' 'python2-htsql' 'python2-htsql-pgsql')
makedepends=('git')
conflicts=('stoq-server-git')
install=stoq-server.install
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