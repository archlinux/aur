# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname='python-mwclient'
pkgdesc="A Python framework to interface with the MediaWiki API"
pkgver=0.10.1
pkgrel=2
arch=('any')
url="https://github.com/mwclient/mwclient"
license=('MIT')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mwclient/mwclient/archive/v${pkgver}.tar.gz")
sha512sums=('80d341863d4c3ba64d56bd978ae85ec1c163dd480eef9a87b8364981a292dd233bb24bd44fa4276043ef9478f5316622efe7cdad178a66574b1f85d34fa61f61')

check() {
  cd "$srcdir/mwclient-$pkgver"
  python setup.py check
}

package() {
  depends=('python' 'python-requests-oauthlib')
  cd "$srcdir/mwclient-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
