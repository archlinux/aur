# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=python2-lxml
pkgver=4.8.0
pkgrel=1
pkgdesc="Python2 binding for the libxml2 and libxslt libraries"
arch=('i686' 'x86_64' 'armv7h')
url="https://lxml.de/"
license=('BSD' 'custom')
depends=('python2' 'libxslt')
makedepends=('python2-setuptools' 'cython2')
source=("https://github.com/lxml/lxml/archive/lxml-$pkgver.tar.gz")
sha512sums=('bbcd8ea001cfa2820dcac4e00de6ded81700b2f0bd4a58bcdd4da05a19a107f57cd56280c4838fe19ee7ecd6be105878bf8c2f1c0e5111899c4ad1a2ba03537f')
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
