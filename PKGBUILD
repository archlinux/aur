# Maintainer: Carmen Bianca Bakker <carmenbbakker@gmail.com>
pkgname=pyparadox
pkgver=0.3.9
pkgrel=1
pkgdesc='A nix launcher for Paradox titles.'
arch=('any')
url='https://gitlab.com/carmenbbakker/pyparadox'
license=('GPL3')
depends=('python>=3.3' 'python-pyqt5' 'python-appdirs')
makedepends=('python-setuptools')
optdepends=('qt5-quickcontrols')
source=("https://files.pythonhosted.org/packages/source/p/pyparadox/pyparadox-${pkgver}.tar.gz"
        'pyparadox-ck2.desktop'
        'pyparadox-eu4.desktop'
        'pyparadox-stellaris.desktop')
md5sums=('8ccb5c7aa0b983df47372277be1a365c'
         '842ee52d5967eff0400261031f885bc6'
         'a2c75a8673659beae2095a565c480361'
         'b82b8b4b48660dcba25b58433a40b2f0')

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
