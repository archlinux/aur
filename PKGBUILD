# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=python-grip
pkgver=4.4.0
pkgrel=1
pkgdesc="Preview GitHub Markdown files like Readme locally before committing them"
arch=('any')
license=('MIT')
url="https://github.com/joeyespo/grip"
depends=('python' 'python-docopt' 'python-flask' 'python-markdown'
         'python-path-and-address' 'python-pygments' 'python-requests')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/joeyespo/grip/archive/v$pkgver.tar.gz")
sha256sums=('fc0a46635b3bd305f9de7e65cf5dcc675a76fdd06abc7112f59a9b2ffe3bbfcc')

package() {
  cd grip-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
