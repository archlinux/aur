# Maintainer: Victor <v1c70rp@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: sn6uv mathics@angusgriffith.com
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: rnestler
# Contributor: mefistofeles

pkgname=mathics
_pkgname=Mathics3
pkgver=2.0.0rc1
_pkgver=2.0.0.rc1
pkgrel=1
pkgdesc="A general-purpose computer algebra system."
arch=('any')
url="https://mathics.github.io/"
license=('GPL3')
depends=('mathics-scanner' 'python-sympy' 'python-mpmath' 'python-numpy'
         'python-palettable' 'python-pint' 'python-dateutil' 'python-llvmlite'
         'python-requests' 'cython' 'python-scikit-image' 'python-wordcloud'
         'python-pyaml')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mathics/Mathics/releases/download/$_pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('ab44531b79e3556c38dea8e6535efc0b1b13e1f6e61c2c8e23a2342127831fbd')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
