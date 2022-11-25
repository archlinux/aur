# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=system-monitoring-center
pkgver=2.0.3
pkgrel=1
pkgdesc="Multi-featured system monitor."
arch=('any')
url="https://github.com/hakandundar34coding/system-monitoring-center"
license=('GPL3')
depends=('dmidecode' 'gtk4' 'iproute2' 'polkit' 'python-cairo' 'python-gobject'
         'util-linux')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5355bd05023260ad8f90dadb3cb039ad3f8a36e334409a1293f95101878cb87d')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
