# Maintainer: Alessandro Pazzaglia <jackdroido at gmail dot com>

pkgname=pyinstaller
_pyname=PyInstaller
pkgver=3.1
pkgrel=1
pkgdesc="An application to convert python scripts into stand-alone binaries"
arch=('i686' 'x86_64')
url="http://www.pyinstaller.org"
license=('GPL')
conflicts=('pyinstaller-git')
depends=('python')
makedepends=('python-setuptools')
optdepends=(
    'python-crypto: executable encryption support'
    'upx: executable compression support'
)
source=(
    "https://github.com/pyinstaller/pyinstaller/releases/download/v${pkgver}/${_pyname}-${pkgver}.tar.gz"
)
sha256sums=(
    '5a28c3bb9d23ea644f9dc9e561e66471b83258d44063bcb108dfbbfe4af3c02b'
)
options=('!strip')

package() {
    cd "${srcdir}/${_pyname}-${pkgver}"

    python setup.py install --root "${pkgdir}"
}
