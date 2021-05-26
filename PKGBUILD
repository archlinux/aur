# Maintainer: bleak <bleaktradition@gmail.com>

pkgname=python-mattermostdriver
pkgver=7.3.0
pkgrel=1
pkgdesc="Python Mattermost Driver for APIv4"
arch=('any')
url="https://vaelor.github.io/python-mattermost-driver/"
license=('MIT')
depends=('python' 'python-requests' 'python-websockets')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Vaelor/python-mattermost-driver/archive/refs/tags/$pkgver.tar.gz")
_extracted_name="python-mattermost-driver"
sha256sums=('7478d75c090b19e00583870529e66153b04b1b77146f5034c643fbe28f3ce663')
sha512sums=('88f3ac74f07e1a0e4422412845c9d74ce16b59f863290869f736d379d6760d9cfdc710b002fdc896bd8b7728fb44d456313ff196d0ceea098c6e32d3f35c6c03')

build() {
  cd "$_extracted_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_extracted_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:ts=2:sw=2:et:
