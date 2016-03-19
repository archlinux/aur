# Maintainer: Matthew Gamble

pkgname=python-usersettings
pkgver=1.0.7
pkgrel=1
pkgdesc="Python module for easily managing persistent settings using an editable format and stored in an OS-appropriate location."
arch=('any')
url="https://pypi.python.org/pypi/usersettings/${pkgver}"
license=('BSD')
depends=('python' 'python-appdirs')
makedepends=('python-setuptools')
source=(
    "https://pypi.python.org/packages/source/u/usersettings/usersettings-${pkgver}.tar.gz"
)
sha256sums=('c48c48f7bc1f00facc74da5ecfb6e1d95c66fc46d9e054c774958570f780d535')

prepare() {
    cd "usersettings-${pkgver}"
    patch < ../../python3-compat.patch
}

package() {
    cd "usersettings-${pkgver}"
    python setup.py install --root="${pkgdir}"
    install -Dm644 docs/LICENSE.txt "${pkgdir}/usr/share/licenses/python-usersettings/LICENSE.txt"
}
