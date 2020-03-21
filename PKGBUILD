# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-vadersentiment
pkgdesc="VADER (Valence Aware Dictionary and sEntiment Reasoner)"
url="https://github.com/cjhutto/vaderSentiment"

pkgver=3.3.1
pkgrel=0

arch=("any")
license=("MIT")

makedepends=("python-setuptools")
depends=("python")

# _name=${pkgname#python-}
_name="vaderSentiment"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=("3eea814596e061f124522065b7b20a775d0a0100972e55620efcf0a1e97ad444ed99138e49ffa2935f736f7a300031030533d8e9cb1c930400588b0bdaa9e3ca")

build() {
  cd "${srcdir}"/vaderSentiment-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/vaderSentiment-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}
