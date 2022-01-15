pkgname=pyxenon
pkgver=0.1
pkgrel=16
pkgdesc="Xenon like game written in python"
arch=("any")
url="https://github.com/denix666/pyxenon"
license=("GPLv3")
makedepends=('python-setuptools')

source=("https://games.os.vc/pygames/pyxenon/pyxenon-${pkgver}-${pkgrel}.tar.gz"
        "pyxenon.png"
        "pyxenon.desktop"
)

package () {
    depends+=('python')
    
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="${pkgdir}"
    
    cd "${srcdir}"
    install -D -m644 pyxenon.png ${pkgdir}/usr/share/pixmaps/pyxenon.png
    install -D -m644 pyxenon.desktop ${pkgdir}/usr/share/applications/pyxenon.desktop
}
sha256sums=('88aedc5b75327922d278e0e2eb6a856682795c5221657d9be7f4912af99cf163'
            'a0814bdb6a4e9382c15f874ed1ec59a38e8897ee27ba3e33b99a31653badfe4f'
            '167c71e5640b72b6f6804b20db2e44d275e1851dcc72875895004cf2c02393f1')
