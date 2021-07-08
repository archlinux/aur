# Maintainer: Victor <v1c70rp@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: sn6uv mathics@angusgriffith.com
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: rnestler
# Contributor: mefistofeles

pkgname=mathics
_pkgname=Mathics3
pkgver=3.1.0
pkgrel=1
pkgdesc="A general-purpose computer algebra system."
arch=('any')
url="https://mathics.org/"
license=('GPL3')
depends=('mathics-scanner' 'python-sympy' 'python-mpmath' 'python-numpy'
         'python-palettable' 'python-pint' 'python-dateutil' 'python-llvmlite'
         'python-requests' 'cython')
makedepends=('python-setuptools')
optdepends=( 'python-psutil: SystemMemory and MemoryAvailable'
             'python-scikit-image: FindMinimum can use this'
             'python-lxml: for HTML parsing used in builtin/fileformats/html'
             'python-wordcloud: Used in builtin/image.py by WordCloud')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mathics/Mathics/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('dd01edc2eb5d6718db0cc35d428907277289501a37688ab60a645036723e6309')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
