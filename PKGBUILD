# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=system-monitoring-center
pkgver=1.5.0
pkgrel=1
pkgdesc="System performance and usage monitoring tool"
arch=('any')
url="https://github.com/hakandundar34coding/system-monitoring-center"
license=('GPL3')
depends=('bash' 'dmidecode' 'gtk3' 'libwnck3' 'mesa-utils' 'python-cairo'
         'python-gobject' 'python-opengl' 'systemd' 'util-linux')
makedepends=('python-setuptools')
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('07418ae8b51bcdae9ed6afe68d99ff3c34acd480783a8e654548fa80a0d715b9')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
