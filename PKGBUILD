# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
pkgname=boxtron
pkgver=0.5.3
pkgrel=1
pkgdesc='Compatibility tool to run DOS games on Steam through native Linux DOSBox'
arch=('i686' 'x86_64')
url="https://github.com/dreamer/$pkgname"
license=('GPL')
depends=('python' 'dosbox' 'inotify-tools' 'timidity++')
makedepends=('git')
optdepends=(
  'steam: The Steam client'
  'soundfont-fluid: required for MIDI support, but another soundfont can be used')
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
