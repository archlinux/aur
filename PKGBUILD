# Maintainer: dchusovitin <dchusovitin@gmail.com>
pkgname='sway-xkb-switcher'
pkgver=0.3.0
pkgrel=1
pkgdesc='Keyboard layout switcher for sway windows'
arch=('x86_64')
url='https://github.com/nmukhachev/sway-xkb-switcher'
license=('MIT')
depends=('python-i3ipc')
makedepends=('python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nmukhachev/sway-xkb-switcher/archive/v$pkgver.tar.gz")

sha256sums=('2c3afee5e891a13340fe8fb2fda81b3c172411d2acd6a50502f9d014133fa773')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-compile --no-warn-script-location "./${pkgname}-${pkgver}"
  python -O -m compileall -q -s ${pkgdir} ${pkgdir}
}

