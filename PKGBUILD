pkgname=pyrobbo
pkgver=0.3.2
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
sha256sums=('9c612f8fd12c1d52cd0787723b0446b45d8f22cb7d4ee7116646e7c921e31017'
            'd29ae49f54b9ba159fd39b0132dad6f0fa252902533934e7021f6cd61a04db33'
            'cc89dcb37e7f2dde624e8db706f0b26c0493fc68a1af5716b615ee992d716a84')

package() {
    cd "${srcdir}/PyRobbo-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    mkdir -p "${pkgdir}/usr/share/applications"
    cp "${srcdir}/pyrobbo.desktop" "${pkgdir}/usr/share/applications/"
    mkdir -p "${pkgdir}/usr/share/pixmaps"
    cp "${srcdir}/robbo.png" "${pkgdir}/usr/share/pixmaps/"
}
