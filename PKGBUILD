pkgname=pyrobbo
pkgver=0.2.1
pkgrel=1
pkgdesc="Clone of an old 8-bit Atari game Robbo"
url="http://github.com/macdems/pyrobbo"
depends=('python' 'python-pygame' 'python-yaml' 'python-appdirs' 'python-setuptools')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=(
    "https://files.pythonhosted.org/packages/source/P/PyRobbo/PyRobbo-$pkgver.tar.gz"
    'pyrobbo.desktop'
    'robbo.png'
)
sha256sums=(
    'fbbebb6f87b0288a2d72f09a94c24771b0502a369e1d8d3ff156d661f7d88fa5'
    'd29ae49f54b9ba159fd39b0132dad6f0fa252902533934e7021f6cd61a04db33'
    'cc89dcb37e7f2dde624e8db706f0b26c0493fc68a1af5716b615ee992d716a84'
)

package() {
    cd "${srcdir}/PyRobbo-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    mkdir -p "${pkgdir}/usr/share/applications"
    cp "${srcdir}/pyrobbo.desktop" "${pkgdir}/usr/share/applications/"
    mkdir -p "${pkgdir}/usr/share/pixmaps"
    cp "${srcdir}/robbo.png" "${pkgdir}/usr/share/pixmaps/"
}
