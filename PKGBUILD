# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-emojientities
_name=${pkgname#python-}
pkgver=0.1.6
pkgrel=3

pkgdesc="retrieves emoji character range from unicode.org"
url="https://gitlab.com/christoph.fink/python-emojientities"
license=("GPL3")

arch=("any")
makedepends=("python-setuptools")
depends=("python-requests")

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("bd0d130c5597a157dc652f9202ee0bfcf4a1053dda92a9400e4ceee34ec5967d")

prepare() {
   rm -Rf "${srcdir}/*/*.egg-info"
}

build() {
   cd "${srcdir}/emojientities-${pkgver}"
   python setup.py build
}

package() {
   cd "${srcdir}/emojientities-${pkgver}"
   python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

}
