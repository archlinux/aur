# Maintainer: Carmen Bianca Bakker <carmenbbakker@gmail.com>
pkgname=pyparadox
pkgver=0.3.6
pkgrel=1
pkgdesc='A nix launcher for Paradox titles.'
arch=('any')
url='https://gitlab.com/carmenbbakker/pyparadox'
license=('GPL3')
depends=('python>=3.3' 'python-pyqt5' 'python-appdirs')
makedepends=('python-pip' 'python-wheel')
optdepends=('qt5-quickcontrols')
source=("https://pypi.python.org/packages/source/p/pyparadox/pyparadox-${pkgver}.tar.gz"
        'pyparadox-ck2.desktop'
        'pyparadox-eu4.desktop')
md5sums=('4bd01836237a78859aa76f72a98f4005'
         '842ee52d5967eff0400261031f885bc6'
         'a2c75a8673659beae2095a565c480361')

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    python setup.py bdist_wheel
    pip install -I --root="$pkgdir/" \
        "dist/pyparadox-${pkgver}-py3-none-any.whl"

    install -D -m 755 "${srcdir}/pyparadox-ck2.desktop" \
        "${pkgdir}/usr/share/applications/pyparadox-ck2.desktop"

    install -D -m 755 "${srcdir}/pyparadox-eu4.desktop" \
        "${pkgdir}/usr/share/applications/pyparadox-eu4.desktop"
}
