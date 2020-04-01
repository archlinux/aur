# Maintainer: Colin Duquesnoy <colin[dot]duquesnoy[at]gmail[dot]com>
pkgname=opencobolide
pkgver=4.7.6
pkgrel=2
pkgdesc="A simple and lightweight COBOL IDE based on the GnuCOBOL compiler."
arch=("any")
url="https://github.com/OpenCobolIDE/OpenCobolIDE"
license=("GPL")
depends=("python" "python-pyqt5" "gnu-cobol")
makedepends=("python-setuptools")
source=("https://github.com/OpenCobolIDE/OpenCobolIDE/archive/${pkgver}.tar.gz"
	"arch-compatibility.patch")
md5sums=('ca7199d3a06d54306b054c862e24c9dc'
         '492c90dffec11d9a2e70544ef821a9ef')

package() {
  cd "$srcdir/OpenCobolIDE-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/arch-compatibility.patch"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
