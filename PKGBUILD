# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-emojientities
pkgver=0.1.5
pkgrel=0

pkgdesc="retrieves emoji character range from unicode.org"
url="https://gitlab.com/christoph.fink/python-emojientities"
license=("GPLv3")

arch=("any")
makedepends=("python-setuptools")
depends=("python-requests")

source=("https://gitlab.com/christoph.fink/python-emojientities/uploads/71e3675a1032bdc0702eb8a5343944cc/emojientities-0.1.5.tar.gz")
sha256sums=("d8cec2414b36a4c62008775d784302b368be0ec4cbe0d605ea376acf0a57a9e0")

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
