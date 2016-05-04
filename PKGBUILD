# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=pjson
pkgver=1.0
pkgrel=1
pkgdesc="Command-line tool to validate and pretty-print JSON and XML"
url="http://igorgue.com/pjson"
arch=('any')
license=('MIT')
depends=('python' 'python-pygments' 'python-xmlformatter')
source=("https://pypi.python.org/packages/b9/2b/5eaaab4f401e2b5c407783bab7fd0ae3a868e5587e1585ffb77cbaab7d1d/pjson-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/igorgue/pjson/0b7566a887824670c652ca75dd9e7d22edbe3c75/LICENSE")
sha256sums=('99b5b545e97521a6b29e2a8e88f6d90bc9b7be47d7a8b784bbc831b1fee1b12b'
            'e640161ec133206a5c8a582fd742519d3ea5409bd7b5929d6c978a24da6ad731')

package() {
  cd pjson-$pkgver

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
