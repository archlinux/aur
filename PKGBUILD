# Maintainer: bleak <bleaktradition@gmail.com>

pkgname=python-mattermostdriver
pkgver=7.3.1
pkgrel=1
pkgdesc="Python Mattermost Driver for APIv4"
arch=('any')
url="https://vaelor.github.io/python-mattermost-driver/"
license=('MIT')
depends=('python' 'python-requests' 'python-websockets')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Vaelor/python-mattermost-driver/archive/refs/tags/$pkgver.tar.gz")
_extracted_name="python-mattermost-driver"
sha256sums=('24f6f647bc6c5f3f44b2e9b37f4bc23499357db5f699fb7ddcc8a30e36e30041')
sha512sums=('da0392df5cbb044f84ff1e8d53db7b229aacf26ad77fbafaeb649e407e0bc2e5425852283752ae4693f701e35ee20d434cf16aa542bc323af776ecaaf59a9bd7')

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
