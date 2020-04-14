# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-emojientities
pkgver=0.1.4
pkgrel=0

pkgdesc="retrieves emoji character range from unicode.org"
url="https://gitlab.com/christoph.fink/python-emojientities"
license=("GPLv3")

arch=("any")
makedepends=("python-setuptools")
depends=("python-requests")

source=("https://gitlab.com/christoph.fink/python-emojientities/uploads/bdf3a23795536c3fb66d1baf097200f0/emojientities-0.1.4.tar.gz")
sha256sums=("a4fdcfa99ee87e45b326ad499215dd9de07ce728c93fb592ac20357745616b00")

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
