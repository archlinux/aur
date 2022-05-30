# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=python2-lxml
pkgver=4.9.0
pkgrel=1
pkgdesc="Python2 binding for the libxml2 and libxslt libraries"
arch=('i686' 'x86_64' 'armv7h')
url="https://lxml.de/"
license=('BSD' 'custom')
depends=('python2' 'libxslt')
makedepends=('python2-setuptools' 'cython2')
source=("https://github.com/lxml/lxml/archive/lxml-$pkgver.tar.gz")
sha512sums=('e85036a96a78da092d7d77dfb482ca00094811d085076bd2a1fe6f5cb31ac9ba8273a1193b5de8af7b4551b4deb41add83db450de8186c0567fcb4522a8da803')
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
