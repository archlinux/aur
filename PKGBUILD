# Maintainer: DanielNak <daniel@tee.cat>
# Python package author: Barney Gale <barney.gale@gmail.com>

_pkgname=elevate
_author=barneygale
pkgname=python-$_pkgname
pkgver=0.1.3
pkgrel=2
pkgdesc="Python library for requesting root privileges"
arch=('any')
url="https://github.com/$_author/$_pkgname"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=("python-$_pkgname")
conflicts=("python-$_pkgname")
source=("https://files.pythonhosted.org/packages/81/32/29ba61063ac124632754e26c65e71217f48ce682fbf8762ee9a0bb0d32de/elevate-0.1.3.tar.gz"
        "https://github.com/barneygale/elevate/raw/master/COPYING.txt"
       )
sha256sums=('53ad19fa1de301fb1de3f8768fb3a5894215716fd96a475690c4d0ff3b1de209'
            'SKIP'
           )

# build() {
#   cd "$srcdir/$_pkgname-$pkgver"
#   python setup.py build
# }

package(){
  install -Dm644 COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
