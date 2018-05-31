# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>
# Contributor: Mariel de Jesus™ <marieldejesus12 at gmail dot com>
_pkgname=stoqserver
pkgname=stoq-server
pkgver=0.16.1
pkgrel=1
pkgdesc="A server for Stoq"
arch=('any')
url="https://github.com/stoq/${pkgname}"
license=('LGPL')
depends=('python' 'stoq' 'binutils' 'supervisor' 'duplicity' 'git' 'openvpn' 'postgresql' 'python-requests'
'python-netifaces' 'python-flask' 'python-flask-restful' 'python2-htsql' 'python2-htsql-pgsql' 'python2-requests'
'python-raven' 'tmate' 'avahi')
makedepends=('')
install=${pkgname}.install
source=("https://launchpad.net/~stoq-dev/+archive/ubuntu/stoq3/+sourcefiles/${pkgname}/${pkgver}-1bionic/${pkgname}_${pkgver}-1bionic.tar.gz")
md5sums=('3c13f0d514dc7ec2acd0fcd198fecb1c')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
