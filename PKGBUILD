# Maintainer: Thomas Quillan <tjquillan@gmail.com>
# Contributor: Alessandro Pazzaglia <jackdroido at gmail dot com>

pkgname=pyinstaller
_pyname=PyInstaller
pkgver=3.3.1
pkgrel=2
pkgdesc="An application to convert python scripts into stand-alone binaries"
arch=('i686' 'x86_64')
url="http://www.pyinstaller.org"
license=('GPL')
conflicts=('pyinstaller-git')
depends=('python'
	 'python-macholib'
	 'python2-pefile')
makedepends=('python-setuptools')
optdepends=(
    'python-crypto: executable encryption support'
    'upx: executable compression support'
)
source=(
    "https://github.com/pyinstaller/pyinstaller/releases/download/v${pkgver}/${_pyname}-${pkgver}.tar.gz"
)
sha256sums=('715f81f24b1ef0e5fe3b3c71e7540551838e46e9de30882aa7c0a521147fd1ce')
options=('!strip')

package() {
    cd "${srcdir}/${_pyname}-${pkgver}"

    python setup.py install --root "${pkgdir}"
}
