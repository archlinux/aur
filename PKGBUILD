# Maintainer: bleak <bleaktradition@gmail.com>

pkgname=python-isc-dhcp-leases
pkgver=0.10.0
pkgrel=1
pkgdesc="Ppython module for reading /var/lib/dhcp/dhcpd.leases from isc-dhcp-server"
arch=('any')
url="https://github.com/MartijnBraam/python-isc-dhcp-leases"
license=('MIT')
depends=('python-distutils-extra' 'python-freezegun')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MartijnBraam/python-isc-dhcp-leases/archive/refs/tags/$pkgver.tar.gz")
_extracted_name="python-isc-dhcp-leases-$pkgver"
sha256sums=('e42fddc305b530493b56354588cdd5764930c4b645cf107407820a13524d34e3')
sha512sums=('4c457d720926ec092823671e42400047e185c2aa118a93163c1eace4783aad2a032798793a1f7a981c779bbfb99900c876bfafe4567800f36e0fcc4b5f7f6ba2')

build() {
  cd "$_extracted_name"
  python setup.py build
}

package() {
  cd "$_extracted_name"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:ts=2:sw=2:et:
