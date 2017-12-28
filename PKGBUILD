# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=pjson
pkgver=1.1
pkgrel=1
pkgdesc="Command-line tool to validate and pretty-print JSON and XML"
url="http://igorgue.com/pjson"
arch=('any')
license=('MIT')
depends=('python' 'python-pygments' 'python-xmlformatter')
source=("https://files.pythonhosted.org/packages/source/p/pjson/pjson-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/igorgue/pjson/ed52f9d98efa/LICENSE")
sha256sums=('f4fc3c3996551eee3d2fa33e8d29364c7f47f156a1371b48617a12e9153bd6c1'
            'e640161ec133206a5c8a582fd742519d3ea5409bd7b5929d6c978a24da6ad731')

package() {
  cd pjson-$pkgver

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
