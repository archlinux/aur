# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=python2-xlsxwriter
pkgver=1.2.8
pkgrel=2
pkgdesc="A Python module for creating Excel XLSX files(Py2 ver)"
arch=('any')
url="https://github.com/jmcnamara/XlsxWriter"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://github.com/jmcnamara/XlsxWriter/archive/RELEASE_${pkgver}.tar.gz")
sha256sums=('ca1645d759ca049c29c36a61a6b035402d64ef873f4f27f58dd9e58c050c8925')

build() {
  cd "$srcdir"/XlsxWriter-RELEASE_${pkgver}
  python2 setup.py build
}

package() {
  cd "$srcdir"/XlsxWriter-RELEASE_${pkgver}
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -D -m644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mv "$pkgdir/usr/bin/vba_extract.py" "$pkgdir/usr/bin/vba_extract2.py"
}

