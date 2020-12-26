# Maintainer: Victor <v1c70rp@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: sn6uv mathics@angusgriffith.com
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: rnestler
# Contributor: mefistofeles

pkgname=mathics
pkgver=1.1.1
pkgrel=1
pkgdesc="A general-purpose computer algebra system."
arch=('any')
url="https://mathics.github.io/"
license=('GPL3')
depends=('python' 'python-sympy' 'python-django' 'python-mpmath' 'python-numpy'
         'python-palettable' 'python-pint' 'python-dateutil' 'python-llvmlite'
         'python-requests' 'cython' 'python-scikit-image' 'python-wordcloud')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mathics/Mathics/releases/download/$pkgver/Mathics3-$pkgver.tar.gz")
sha256sums=('2a4b59f824a1ebdc2390783839b4aa2920db2dc4cebc3286d2b0bb1543cc7fd2')

build() {
  cd "${srcdir}/Mathics3-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/Mathics3-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
