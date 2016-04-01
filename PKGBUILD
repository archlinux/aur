# Maintainer: Carmen Bianca Bakker <carmenbbakker@gmail.com>
pkgname=pyparadox
pkgver=0.3.7
pkgrel=2
pkgdesc='A nix launcher for Paradox titles.'
arch=('any')
url='https://gitlab.com/carmenbbakker/pyparadox'
license=('GPL3')
depends=('python>=3.3' 'python-pyqt5' 'python-appdirs')
makedepends=('python-setuptools')
optdepends=('qt5-quickcontrols')
source=("https://pypi.python.org/packages/source/p/pyparadox/pyparadox-${pkgver}.tar.gz"
        'pyparadox-ck2.desktop'
        'pyparadox-eu4.desktop')
md5sums=('3b52d6aa539a104b9fe9e1da2b3a6944'
         '842ee52d5967eff0400261031f885bc6'
         'a2c75a8673659beae2095a565c480361')

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    python setup.py install --root="${pkgdir}/"

    install -D "${srcdir}/pyparadox-ck2.desktop" \
        "${pkgdir}/usr/share/applications/pyparadox-ck2.desktop"

    install -D "${srcdir}/pyparadox-eu4.desktop" \
        "${pkgdir}/usr/share/applications/pyparadox-eu4.desktop"

    install -D pyparadox/resources/paradox.png \
        "${pkgdir}/usr/share/pixmaps/paradox.png"
}
