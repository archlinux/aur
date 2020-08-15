# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname="python-pystray"
pkgver=0.16.0
pkgrel=1
arch=(any)
license=('GPL3')
pkgdesc="Provides systray integration."
url="https://github.com/moses-palmer/pystray"
depends=('python-six' 'python-pillow' 'python-xlib>=0.17')
makedepends=('python>=3.4' 'python-setuptools' 'python-pip' 'python-wheel')
source=("https://github.com/moses-palmer/pystray/archive/v${pkgver}.tar.gz")
sha512sums=('1571a91851cb9ff85cc7497162db687d3cef3ff6c863d1f8ede4ca1275de1f0a1dcf09a313a744f39f5666765c507c0dccf5f75320e5c7bd6dd4074ef2e5b83a')

build() {
  cd "pystray-$pkgver"
  python setup.py build
}

package_python-pystray() {
  cd "pystray-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
