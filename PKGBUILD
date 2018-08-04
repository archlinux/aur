# Maintainer: Tom Harpaz <bigrush@protonmail.com>
# Maintainer: Chen Tondovsko <chn566@gmail.com>

pkgname=nama-gui
pkgver=1.0.5.r1.g41c65eb
pkgrel=1
pkgdesc="This tool uses nmcli to easily set your network configuration with GUI"
arch=('any')
url="https://github.com/bigrush/nama-gui"
license=('GPLv3')
depends=('bash' 'nama' 'zenity')
source=("$pkgname::git+https://github.com/bigrush/nama-gui.git")

md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'

}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/nama-gui/LICENSE.md"
}

