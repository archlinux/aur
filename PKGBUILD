# Maintainer: Carmen Bianca Bakker <carmenbbakker@gmail.com>
pkgname=pyparadox
pkgver=0.3.4
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
md5sums=('fbd90518332abd8223c8e9d1de8a6433'
         'f1b94aee6fd59e5c329157a2a6af936e'
         'c0d932ed642fbdda6c498de11c37d24e')

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    python setup.py install --root="${pkgdir}/"

    install -D -m 755 "${srcdir}/pyparadox-ck2.desktop" \
        "${pkgdir}/usr/share/applications/pyparadox-ck2.desktop"

    install -D -m 755 "${srcdir}/pyparadox-eu4.desktop" \
        "${pkgdir}/usr/share/applications/pyparadox-eu4.desktop"
}
