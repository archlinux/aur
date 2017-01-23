# Maintainer: Alessandro Pazzaglia <jackdroido at gmail dot com>

pkgname=pyinstaller2
_pyname=PyInstaller
pkgver=3.2.1
pkgrel=1
pkgdesc="An application to convert python scripts into stand-alone binaries"
arch=('i686' 'x86_64')
url="http://www.pyinstaller.org"
license=('GPL')
depends=('python2')
makedepends=('python2-setuptools')
optdepends=(
    'python2-crypto: executable encryption support'
    'upx: executable compression support'
)
source=(
    "https://github.com/pyinstaller/pyinstaller/releases/download/v${pkgver}/${_pyname}-${pkgver}.tar.bz2"
)
sha256sums=(
    'f08ca806bc26e62034bca181a4b85de22568a3d39bdb062f05927c6e86c2a48c'
)
options=('!strip')

package() {
    cd "${srcdir}/${_pyname}-${pkgver}"

    sed -i -e 's_pyi-\(.* = \)_pyi2-\1_g' \
        -e 's_pyinstaller\(.* = \)_pyinstaller2\1_g' setup.py

    python2 setup.py install --root "${pkgdir}"
}
