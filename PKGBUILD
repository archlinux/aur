# Maintainer: Victor <v1c70rp@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: sn6uv mathics@angusgriffith.com
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: rnestler
# Contributor: mefistofeles

pkgname=mathics
pkgver=1.1.0rc1
pkgrel=1
pkgdesc="A general-purpose computer algebra system."
arch=('any')
url="https://mathics.github.io/"
license=('GPL3')
depends=('python' 'python-sympy' 'python-django' 'python-mpmath' 'python-numpy'
         'python-palettable' 'python-pint' 'python-dateutil' 'python-llvmlite'
         'python-requests' 'cython')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mathics/Mathics/releases/download/$pkgver/Mathics-$pkgver.tar.gz")
sha256sums=('330846db1c7c0620db8699c77ece4a9763d2f110fbb2b92b5686bf442563a602')

build() {
  cd "${srcdir}/Mathics-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/Mathics-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
}
