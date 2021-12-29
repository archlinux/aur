# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=python2-lxml
pkgver=4.6.3
pkgrel=3
pkgdesc="Python2 binding for the libxml2 and libxslt libraries"
arch=('i686' 'x86_64')
url="https://lxml.de/"
license=('BSD' 'custom')
depends=('python2' 'libxslt')
makedepends=('python2-setuptools' 'cython2')
source=("https://github.com/lxml/lxml/archive/lxml-$pkgver.tar.gz")
sha512sums=('50e42d6269dc45b4c0ab3285c49307f8bee87fcc4b9e0f531e1ee37bcf83c5938b7e361f906a3158fac8df89a79b932dd64a8839455e45f45f3a5f0ba73ff6a5')
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
