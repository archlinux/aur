# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Stick <stick@stma.is>

_name=i3ipc-python
pkgname=python-i3ipc
pkgver=2.1.1
pkgrel=1
pkgdesc='An improved Python library to control i3wm'
arch=('any')
url="https://github.com/altdesktop/${_name}"
license=('BSD')
conflicts=('i3ipc-python')
replaces=('i3ipc-python')
depends=('python' 'python-xlib')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/altdesktop/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('0dcd46519603ce3e52c4ae69e50efe1e7a31c03af15e0b9b639055de40daff15')

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
