# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-emojientities
pkgver=0.1.3
pkgrel=0

pkgdesc="retrieves emoji character range from unicode.org"
url="https://gitlab.com/christoph.fink/python-emojientities"
license=("GPLv3")

arch=("any")
makedepends=("python-setuptools")
depends=("python-requests")

source=("https://gitlab.com/christoph.fink/python-emojientities/uploads/189f111ef60d1df55df95534984110f9/emojientities-0.1.3.tar.gz")
sha256sums=("0b4696f7ec65e94dbb0f10ddf757be34a7fa4490e9ea4fb5bfa30972a3778973")

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
