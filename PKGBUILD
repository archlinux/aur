# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=python2-lxml
pkgver=4.7.1
pkgrel=2
pkgdesc="Python2 binding for the libxml2 and libxslt libraries"
arch=('i686' 'x86_64' 'armv7h')
url="https://lxml.de/"
license=('BSD' 'custom')
depends=('python2' 'libxslt')
makedepends=('python2-setuptools' 'cython2')
source=("https://github.com/lxml/lxml/archive/lxml-$pkgver.tar.gz")
sha512sums=('33c88ff07152437a09268f3348ada97549686b5a59e2135631991ecc79ad02f35c20aae5d8363d2795bf058b05ef70fa6fbb56b081308cd89b073e176f4872d9')
_dir="lxml-lxml-${pkgver}"

build() {
  cd "${_dir}"
  python2 setup.py build
}

package() {
  cd "${_dir}"
	python2 setup.py install --root "${pkgdir}" --prefix=/usr --optimize=1 --skip-build
  
	install -Dm644 'LICENSES.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 'doc/licenses/BSD.txt' "$pkgdir/usr/share/licenses/$pkgname/BSD.txt"
	install -Dm644 'doc/licenses/elementtree.txt' "$pkgdir/usr/share/licenses/$pkgname/elementtree.txt"
}
