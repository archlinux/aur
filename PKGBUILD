# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=pjson
pkgver=0.6
pkgrel=1
pkgdesc="Command-line tool to validate and pretty-print JSON and XML"
url="http://igorgue.com/pjson"
arch=('any')
license=('MIT')
depends=('python' 'python-pygments' 'python-xmlformatter')
source=("https://pypi.python.org/packages/source/p/pjson/pjson-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/igorgue/pjson/master/LICENSE")
sha256sums=('4d44602a6cf1761c459c6e8ae1828217ea72973b131dcd8d0dcaac27891ebcc1'
            'e640161ec133206a5c8a582fd742519d3ea5409bd7b5929d6c978a24da6ad731')

package() {
  cd pjson-$pkgver

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
