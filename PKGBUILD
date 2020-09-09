# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Contributor: Jakub Klinkovský <j.l.k@gmx.com>

pkgname=python-scandir
pkgdesc="A better directory iterator and faster os.walk()"
pkgver=1.10.0
pkgrel=3
arch=('i686' 'x86_64')
url="https://github.com/benhoyt/scandir"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/s/scandir/scandir-${pkgver}.tar.gz")
md5sums=('f8378f4d9f95a6a78e97ab01aa900c1d')
sha256sums=('4d4631f6062e658e9007ab3149a9b914f3548cb38bfb021c64f39a025ce578ae')

build() {
  cd "scandir-$pkgver"
  python setup.py build
}

package() {
  cd "scandir-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize 1
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt

}

# vim:set ts=2 sw=2 et:
