# Maintainer: Victor <v1c70rp@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: sn6uv mathics@angusgriffith.com
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: rnestler
# Contributor: mefistofeles

pkgname=mathics
pkgver=1.0
pkgrel=2
pkgdesc="A general-purpose computer algebra system."
arch=('any')
url="https://mathics.github.io/"
license=('GPL3')
depends=('python' 'python-colorama' 'python-django18' 'python-mpmath'
         'python-dateutil' 'python-six' 'python-sympy')
makedepends=('python-setuptools')
source=("mathics-$pkgver.tgz::https://github.com/mathics/Mathics/releases/download/v$pkgver/mathics-$pkgver.tgz")
sha256sums=('865f146738e220d4f3dfaea11bcef9330957963644a33f67a58255bc29741282')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}
