# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: Jon Nordby <jononor@gmail.com>
# Contributor: Alexandre Courbot <gnurou@gmail.com>

_pkgname="launchpadlib"
pkgname="python2-${_pkgname}"
pkgver="1.10.3"
pkgrel="1"
pkgdesc="A free Python library for scripting Launchpad through its web services interface."
arch=('i686' 'x86_64')
url="https://launchpad.net/launchpadlib"
license=('LGPL3')
depends=('python>=2.5' 'python2-lazr-restful' 'python2-lazr-uri' 'python2-lazr-restfulclient' 'python2-keyring')
makedepends=('python>=2.5')
conflicts=("${_pkgname}")
provides=("${pkgname}")
source=("http://launchpad.net/${_pkgname}/trunk/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('741ca0080dfa8b307db2d89c6050c41d975d96160419b3292b19443ce656ef6b')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=4 sw=2 ft=sh et: