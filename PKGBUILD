# Maintainer: dchusovitin <dchusovitin@gmail.com>
pkgname='i3-xkb-switcher'
pkgver=0.2.1
pkgrel=1
pkgdesc='Keyboard layout switcher for i3 windows'
arch=('x86_64')
url='https://github.com/inn0kenty/i3-xkb-switcher'
license=('MIT')
depends=('python-i3ipc' 'python-xkbgroup')
makedepends=('python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/inn0kenty/i3-xkb-switcher/archive/v$pkgver.tar.gz")

sha256sums=('8d03c40226321253b7c988ff23d5808eeaedeea6e0824d5116958107bed76510')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-compile --no-warn-script-location "./${pkgname}-${pkgver}"
  python -O -m compileall -q -s ${pkgdir} ${pkgdir}
}

