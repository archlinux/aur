# Maintainer: Alessandro Pazzaglia <jackdroido at gmail dot com>

pkgname=pyinstaller
_pyname=PyInstaller
pkgver=3.2
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
    '7598d4c9f5712ba78beb46a857a493b1b93a584ca59944b8e7b6be00bb89cabc'
)
options=('!strip')

package() {
    cd "${srcdir}/${_pyname}-${pkgver}"

    python setup.py install --root "${pkgdir}"
}
