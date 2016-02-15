# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor:György Balló <ballogy@freestart.hu>

_pkgname="wadllib"
pkgname="python2-wadllib"
pkgver="1.3.2"
pkgrel="2"
pkgdesc="The Web Application Description Language is an XML vocabulary for describing the capabilities of HTTP resources. wadllib can be used in conjunction with an HTTP library to navigate and manipulate those resources"
arch=('any')
url="https://launchpad.net/wadllib"
license=('LGPL')
depends=('python2-lazr-uri' 'python2-simplejson')
provides=("${pkgname}")
source=("http://launchpad.net/${_pkgname}/trunk/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('140e43fc16d4352a98a90a450c6326bee5e6de73ae373a569947f3b505405034')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=4 sw=2 ft=sh et: