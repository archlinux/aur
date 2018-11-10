# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: Jon Nordby <jononor@gmail.com>
# Contributor: Alexandre Courbot <gnurou@gmail.com>
#
_pkgname="launchpadlib"
pkgname="python2-${_pkgname}"
pkgver="1.10.6"
pkgrel="1"
pkgdesc="A free Python library for scripting Launchpad through its web services interface."
arch=('i686' 'x86_64')
url="https://launchpad.net/launchpadlib"
license=('LGPL3')
depends=('python>=2.5' 'python2-lazr-restful' 'python2-lazr-uri' 'python2-lazr-restfulclient' 'python2-keyring')
makedepends=('python>=2.5')
conflicts=("${_pkgname}")
provides=("${pkgname}")
source=("${url}/trunk/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e4709c18214863d147c6e0415e695d5cfddefc0dbd6ea28eb03e6eada956ae8b')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=4 sw=4 ft=sh et syn=sh ft=sh:
