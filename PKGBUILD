# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
pkgname=boxtron
pkgver=0.5.2
pkgrel=1
pkgdesc='Compatibility tool to run DOS games on Steam through native Linux DOSBox – NOTE: Won’t work as intended until next Steam beta cycle!'
arch=('i686' 'x86_64')
url="https://github.com/dreamer/$pkgname"
license=('GPL')
depends=('dosbox' 'inotify-tools')
makedepends=('git')
optdepends=(
  'steam: The Steam client'
  'timidity++: MIDI support'
  'soundfont-fluid: MIDI support')
install=$pkgname.install
source=("git+$url.git#tag=v$pkgver")
sha512sums=('SKIP')

check() {
  cd "$pkgname"
  make test
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" prefix=/usr install
}
