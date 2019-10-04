# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
pkgname=boxtron
pkgver=0.5.2
pkgrel=2
pkgdesc='Compatibility tool to run DOS games on Steam through native Linux DOSBox – NOTE: Won’t work as intended until next Steam beta cycle!'
arch=('i686' 'x86_64')
url="https://github.com/dreamer/$pkgname"
license=('GPL')
depends=('python' 'dosbox' 'inotify-tools' 'timidity++')
makedepends=('git')
optdepends=(
  'steam: The Steam client'
  'soundfont-fluid: required for MIDI support, but another soundfont can be used')
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
