# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=python-networkx-1.11
pkgver=1.11
pkgrel=1
pkgdesc='Python package for creating and manipulating graphs and networks'
provides=('python-networkx=1.11')
conflicts=('python-networkx')
url=http://networkx.github.io/
depends=(python)
makedepends=(python-distribute)
license=(custom:BSD)
arch=(any)
source=('https://pypi.python.org/packages/3b/d4/1b6ca16678d13ffd426bcd199231f3d5effaa6d234747fb88899e649dec3/networkx-1.11.zip'
        'https://raw.githubusercontent.com/networkx/networkx/v1.11/LICENSE.txt')
md5sums=('c7690890aa28eb2e061f9e50c20ebada'
         '925586ea588eb990de840dc71ea3752f')

build() {
    cd "${srcdir}/networkx-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/networkx-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 
    install -Dm644 "${srcdir}/LICENSE.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
