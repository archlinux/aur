# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

_pkgname="lazr.restful"
pkgname="python2-lazr-restful"
pkgver="0.19.10"
pkgrel="1"
pkgdesc="Publish data model objects as RESTful web services by annotating their Zope interfaces."
arch=('i686' 'x86_64')
url="https://launchpad.net/lazr.restful"
license=('LGPL3')
depends=('python>=2.5')
makedepends=('python>=2.5')
provides=("${pkgname}")
source=("http://launchpad.net/${_pkgname}/trunk/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('62a93fdba7af0fc5441ff3781931cc778dfd5ee8ec9d9c71ff76d9f35fa08459')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=4 sw=2 ft=sh et: