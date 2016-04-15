# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-requests-unixsocket
pkgver=0.1.5
pkgrel=1
pkgdesc="Use requests to talk HTTP via a UNIX domain socket"
arch=('any')
depends=('python' 'python-requests' 'python-urllib3')
makedepends=('python-setuptools')
url="https://github.com/msabramo/requests-unixsocket"
license=('Apache')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/msabramo/requests-unixsocket/tar.gz/$pkgver)
sha256sums=('eb1be088661b88f80c41e64187e488aba5382d0e9418fbea6b00b2bd4f79c9bf')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
