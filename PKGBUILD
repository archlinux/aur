# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-requests-unixsocket
pkgver=0.1.5
pkgrel=2
pkgdesc="Use requests to talk HTTP via a UNIX domain socket"
arch=('any')
depends=('python' 'python-requests' 'python-urllib3')
makedepends=('python-setuptools')
url="https://github.com/msabramo/requests-unixsocket"
license=('Apache')
options=('!emptydirs')
source=(https://pypi.python.org/packages/f3/94/67d781fb32afbee0fffa0ad9e16ad0491f1a9c303e14790ae4e18f11be19/requests-unixsocket-0.1.5.tar.gz)
md5sums=('08453c8ef7dc03863ff4a30b901e7c20')
sha256sums=('a91bc0138f61fb3396de6358fa81e2cd069a150ade5111f869df01d8bc9d294c')

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
