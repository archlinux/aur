# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-vadersentiment
pkgdesc="VADER (Valence Aware Dictionary and sEntiment Reasoner)"
url="https://github.com/cjhutto/vaderSentiment"

pkgver=3.3.2
pkgrel=3

arch=("any")
license=("MIT")

makedepends=("python-setuptools")
depends=("python")

# _name=${pkgname#python-}
_name="vaderSentiment"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=("e64e066186d32e9617ccb7eaf29b80c7921d79a7d675f11ebfb7ec41ebb77a43aa9611b1b01bdc9930d3d888a40c7a2c278dd958b8b3328b2b8bfdb2fa38cd77")

build() {
  cd "${srcdir}"/vaderSentiment-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/vaderSentiment-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}
