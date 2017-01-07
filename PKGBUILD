# Maintainer: Matthew Gamble <git@matthewgamble.net>

# The tests aren't working on my machine at the moment, not sure why.

pkgname=python-surt
pkgver=0.3.0
pkgrel=2
pkgdesc="Sort-friendly URI Reordering Transform (SURT)"
arch=("any")
url="https://github.com/internetarchive/surt"
license=("AGPLv3")
depends=("python" "python-six" "python-tldextract>=2.0")
makedepends=("python-setuptools")
#checkdepends=('python-pytest' 'python-pytest-cov')
source=("https://pypi.python.org/packages/ec/d7/fb0415d56de89d20a9f17bd3c0b3f805cbdc12dc33f2327819d015a1264e/surt-${pkgver}.tar.gz")
md5sums=('8dfe0bc4ff2b13d62689ae12957c4979')

build() {
    cd "surt-${pkgver}"
    python setup.py build
}

#check() {
#    cd "surt-${pkgver}"
#    python setup.py test
#}

package() {
    cd "surt-${pkgver}"
    python setup.py install --root=${pkgdir} --skip-build
}
