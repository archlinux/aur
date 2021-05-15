# Maintainer: Victor <v1c70rp@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: sn6uv mathics@angusgriffith.com
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: rnestler
# Contributor: mefistofeles

pkgname=mathics
_pkgname=Mathics3
pkgver=2.2.0
pkgrel=1
pkgdesc="A general-purpose computer algebra system."
arch=('any')
url="https://mathics.org/"
license=('GPL3')
depends=('mathics-scanner' 'python-sympy' 'python-mpmath' 'python-numpy'
         'python-palettable' 'python-pint' 'python-dateutil' 'python-psutil'
         'python-llvmlite' 'python-requests' 'cython' 'python-scikit-image'
         'python-wordcloud' 'python-lxml')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mathics/Mathics/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('5d84244bbfbcc4c6cc3ac2678ef1af8f3f51167d2bf050f67c8b2475ac4c6ee4')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
