# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: György Balló <ballogy at freestart dot hu>
#
_pkgname="lazr.restfulclient"
pkgname="python2-lazr-restfulclient"
pkgver="0.14.2"
pkgrel="1"
pkgdesc="A programmable client library that takes advantage of the commonalities among lazr.restful web services to provide added functionality on top of wadllib"
arch=('i686' 'x86_64')
url="https://launchpad.net/lazr.restfulclient"
license=('LGPL')
depends=('python2-httplib2' 'python2-oauth2' 'python2-wadllib')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/trunk/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('1ee3acf3bb38861546251f2f158a5e5df403d93b4b040b08c3f297e24b3a035a')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

#  vim:set ts=4 sw=4 ft=sh et syn=sh ft=sh:
