# Maintainer: Carmen Bianca Bakker <carmenbbakker@gmail.com>
pkgname=pyparadox
pkgver=0.3.5
pkgrel=2
pkgdesc='PyParadox is a nix launcher for Paradox titles.'
arch=('any')
url='https://gitlab.com/carmenbbakker/pyparadox'
license=('GPL3')
depends=('python>=3.3' 'python-pyqt5' 'python-appdirs')
makedepends=('python-setuptools')
optdepends=('qt5-quickcontrols')
source=("https://pypi.python.org/packages/source/p/pyparadox/pyparadox-${pkgver}.tar.gz"
        'pyparadox-ck2.desktop'
        'pyparadox-eu4.desktop')
md5sums=('a91117fb0f3f7eeb836b25f7c7bee76f'
         '842ee52d5967eff0400261031f885bc6'
         'a2c75a8673659beae2095a565c480361')

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    python setup.py install --root="${pkgdir}/"

    install -D -m 755 "${srcdir}/pyparadox-ck2.desktop" \
        "${pkgdir}/usr/share/applications/pyparadox-ck2.desktop"

    install -D -m 755 "${srcdir}/pyparadox-eu4.desktop" \
        "${pkgdir}/usr/share/applications/pyparadox-eu4.desktop"
}
