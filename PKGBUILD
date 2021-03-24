# Maintainer: bleak <bleaktradition@gmail.com>

pkgname=python-mattermostdriver
pkgver=7.2.0
pkgrel=1
pkgdesc="Python Mattermost Driver for APIv4"
arch=('any')
url="https://vaelor.github.io/python-mattermost-driver/"
license=('MIT')
depends=('python' 'python-requests' 'python-websockets')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Vaelor/python-mattermost-driver/archive/refs/tags/$pkgver.tar.gz")
_extracted_name="python-mattermost-driver"
sha512sums=('aae1fed45ff2024edee3c09663424ed17cc2466f893eb989dbe407d2ae515e03b216b24aff500e15168c46027796d70feb9780ab481c4b21a91b11326dbe0cbe')
sha256sums=('5de915f1383fe63acebf739be8b7706c94cbe73d62151ad5a5085cf8e4560fc8')

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
