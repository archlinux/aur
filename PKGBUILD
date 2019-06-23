# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Stick <stick@stma.is>

_name=i3ipc-python
pkgname=python-i3ipc
pkgver=1.7.1
pkgrel=2
pkgdesc='An improved Python library to control i3wm'
arch=('any')
url="https://github.com/acrisci/${pkgname}"
license=('BSD')
conflicts=('i3ipc-python')
replaces=('i3ipc-python')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/acrisci/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('b13f4013941e8252988e63d9b7528ba278e4af6edbce031936c5877187fc4d8c')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm755 -t "${pkgdir}/usr/share/doc/${pkgname}/examples" examples/*.py
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

# vim:set ts=4 sw=4 et:
