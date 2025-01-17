# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-vadersentiment
pkgdesc="VADER (Valence Aware Dictionary and sEntiment Reasoner)"
url="https://github.com/cjhutto/vaderSentiment"

pkgver=3.3.2
pkgrel=6

arch=("any")
license=("MIT")

makedepends=("python-setuptools")
depends=("python")

# _name=${pkgname#python-}
_name="vaderSentiment"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=("de93f37569df5db9bb58a55abcc88b76a6d61901333a72dc4df5ef41b11d5f0b270fce2966caccdeac67c61120204774cb9aa546a435f5e5edeb422582d1c207")

build() {
  cd "${srcdir}"/vaderSentiment-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/vaderSentiment-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}
