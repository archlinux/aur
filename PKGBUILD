# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=system-monitoring-center
pkgver=1.7.0
pkgrel=1
pkgdesc="System performance and usage monitoring tool"
arch=('any')
url="https://github.com/hakandundar34coding/system-monitoring-center"
license=('GPL3')
depends=('bash' 'dmidecode' 'gtk3' 'libwnck3' 'mesa-utils' 'python-cairo'
         'python-gobject' 'systemd' 'util-linux')
makedepends=('python-setuptools')
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dbca72c011b07e9d73111432346d217e99f527bba2bfd3f301eb84329a668916')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
