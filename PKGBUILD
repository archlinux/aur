# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=python2-lxml
pkgver=4.9.0_2
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc='Python2 binding for the libxml2 and libxslt libraries'
arch=('i686' 'x86_64' 'armv7h')
url='https://lxml.de/'
license=('BSD' 'custom')
depends=('python2' 'libxslt')
makedepends=('python2-setuptools' 'cython2')
source=("https://github.com/lxml/lxml/archive/lxml-$_pkgver.tar.gz")
sha512sums=('ef11f51cb682fb42dff0cd024de1f7e52c95dfae403a6914e8246f36ffdb110120d1f75a9cb60f62d27723ad3aecdeb4044a22461032a1f792530c7becd2b25e')
_dir="lxml-lxml-${_pkgver}"

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
