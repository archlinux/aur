# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-twitter3
pkgdesc="A Python wrapper around the Twitter API"
url="https://github.com/bear/python-twitter"

provides=("python-twitter")
conflicts=("python-twitter")

pkgver=3.5
pkgrel=6

arch=("any")
license=("Apache")

depends=(
    "python-requests-oauthlib"
    "python-future"
   )
makedepends=(
    "python-setuptools"
    "python-pytest-runner"
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bear/python-twitter/archive/v${pkgver}.tar.gz")
b2sums=("ac42fea19d84cb66a2e5787eaf37e4aeaa5cde4ef245191c6cd1cab4fd686ad0431fabf32d0a1714e2f7fb85aa00b3df8a7ac317d126147906ae9cd0029de1cb")

build() {
  cd "${srcdir}/python-twitter-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/python-twitter-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}
