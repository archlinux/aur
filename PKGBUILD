# Maintainer: bastidest <bastidest at mailbox dot org>

_name=findsystemfontsfilename

pkgname=python-${_name,,}
pkgver=0.3.1
pkgrel=2
pkgdesc="Find the system fonts filename"
url="https://github.com/moi15moi/FindSystemFontsFilename/"
makedepends=(python-build python-installer python-setuptools python-wheel)
depends=()
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('04551e69a4b5b7a778cc7301adfbff0813f85c606827428ba9901f27a7770c40')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
