# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: György Balló <ballogy at freestart dot hu>
#
_pkgname="lazr.restfulclient"
pkgname="python2-lazr-restfulclient"
pkgver="0.13.5"
pkgrel="1"
pkgdesc="A programmable client library that takes advantage of the commonalities among lazr.restful web services to provide added functionality on top of wadllib"
arch=('i686' 'x86_64')
url="https://launchpad.net/lazr.restfulclient"
license=('LGPL')
depends=('python2-httplib2' 'python2-oauth2' 'python2-wadllib')
source=("http://launchpad.net/${_pkgname}/trunk/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('722f27a8baefa83c347fe3a6330de5fe381d8473d3bb7c5726762cabf9556800')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

#  vim:set ts=4 sw=4 ft=sh et syn=sh ft=sh:
