# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>
# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname="python-pystray"
pkgver=0.17.1
pkgrel=1
arch=(any)
license=('GPL3')
pkgdesc="Allows to create a system tray icon"
url="https://github.com/moses-palmer/pystray"
depends=('python-six' 'python-pillow' 'python-xlib>=0.17' 'libappindicator-gtk3')
makedepends=('python>=3.4' 'python-setuptools' 'python-pip' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/moses-palmer/pystray/archive/v${pkgver}.tar.gz")
sha512sums=('ca56fe3ea0588fcd1d3829e18344b856e9031d4531bafa66349056f858fb94a112579b9114d7fa9406dc9f9424ae298bee9825cba1af7014a173c63d0590c8e1')

build() {
  cd "pystray-$pkgver"
  python setup.py build
}

package_python-pystray() {
  cd "pystray-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
