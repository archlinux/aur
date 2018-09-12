# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>
#
_pkgname="ws4py"
pkgname="python-${_pkgname}"
pkgver=0.5.1
pkgrel=1
pkgdesc="WebSocket client and server library for Python."
url="https://github.com/Lawouach/WebSocket-for-Python"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('3fb493bd1af767a46cd6cb9db4c7d7b8db5eac3466f7513aa9cd20385e4740d4')

package() {
    cd "${srcdir}/WebSocket-for-Python-${pkgver}"
    python setup.py install --optimize=1 \
        --prefix=/usr \
        --root="${pkgdir}"
    install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -vDm 644 {CHANGELOG,README}.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=4 sw=4 ft=sh et:
