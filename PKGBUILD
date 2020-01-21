# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-vadersentiment
pkgdesc="VADER (Valence Aware Dictionary and sEntiment Reasoner)"
url="https://github.com/cjhutto/vaderSentiment"

pkgver=3.2.1
pkgrel=2

arch=("any")
license=("MIT")

makedepends=("python-setuptools")
depends=("python")

# _name=${pkgname#python-}
_name="vaderSentiment"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=("1ca9b2e3f1decf92825f456272e7466808ebd830b8c11d224ade4e16285b6b0d16167384f0fc097416b48ee7f77829db3ecf652487f68c2f97a71b275ab929cd")

build() {
  cd "${srcdir}"/vaderSentiment-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/vaderSentiment-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}
