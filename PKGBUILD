# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
pkgname=boxtron
pkgver=0.5.0
pkgrel=1
pkgdesc='Compatibility tool to run DOS games on Steam through native Linux DOSBox – NOTE: Won’t work as intended until next Steam beta cycle!'
arch=('i686' 'x86_64')
url="https://github.com/dreamer/$pkgname"
license=('GPL')
depends=('dosbox' 'inotify-tools')
optdepends=(
  'steam: The Steam client'
  'timidity++: MIDI support'
  'soundfont-fluid: MIDI support')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/$pkgname.tar.xz")
sha512sums=('054011dda43f5b923026bbb20913d46a752fb42818c27a9447787b03cab01184c16cfb0c4f23e5490c962a32c025b326abd90e2b9d6bc0ebfeed4bf83fda9eb1')

package() {
  install -dm755 "$pkgdir"/usr/share/steam/compatibilitytools.d
  mv "$pkgname" "$pkgdir"/usr/share/steam/compatibilitytools.d/
}
