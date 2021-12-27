# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=snuggs
pkgname=('python2-snuggs')
pkgver=1.4.7
pkgrel=1
pkgdesc="Provide s-expressions for Numpy, for Python 2.7"
arch=('any')
url='https://github.com/mapbox/snuggs'
license=('MIT')
makedepends=('python2-setuptools')
depends=('python2-click' 'python2-numpy' 'python2-pyparsing')
options=(!emptydirs)
sha256sums=('501cf113fe3892e14e2fee76da5cd0606b7e149c411c271898e6259ebde2617b'
            '29460627842ca33c406297d8b9b2805d8faeb22de7a145358509533b4eca4599')
_pypi='https://files.pythonhosted.org/packages'
_path='93/19/0d11ab370735dde61076a0e41644e5593821776e69e3b0344626cfa0e56a'
source=("$_pypi/$_path/$_name-$pkgver.tar.gz"
  "https://raw.githubusercontent.com/mapbox/$_name/$pkgver/LICENSE")

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
