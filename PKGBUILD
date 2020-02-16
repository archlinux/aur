# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Evangelos Foutras <foutrelis@gmail.com>
#
_pkgname="pyinotify"
pkgname="python2-${_pkgname}"
pkgver="0.9.6"
pkgrel="7"
pkgdesc='Python module used for monitoring filesystems events on Linux platforms with inotify.'
arch=('any')
url="https://github.com/seb-m/pyinotify"
license=('custom:MIT')
depends=('python2')
makedepends=('python2')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('7943f198c5cef2bdc121d847937fbe565daaa7d4daaf1b8de8ef5689812f481c')

build() {
    cd ${_pkgname}-$pkgver
    python2 setup.py build
}

package() {
    cd ${_pkgname}-$pkgver
    python2 setup.py install --root=${pkgdir} -O1

    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -m644 COPYING \
        ${pkgdir}/usr/share/licenses/${pkgname}
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
