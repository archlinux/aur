# Maintainer: Connor Langan <connorjameslangan@gmail.com>
pkgname=mechsim
pkgver=1.1.0
pkgrel=1
pkgdesc="Mechanical keyboard sound simulator"
arch=('x86_64')
url="https://github.com/cjlangan/mechsim"
license=('MIT')

depends=(
  'json-c'
  'libpulse'
  'systemd-libs'
)

makedepends=(
  'gcc'
  'make'
  'pkgconf'
  'libevdev'
  'libinput'
  'libsndfile'
)

source=("https://github.com/cjlangan/mechsim/releases/download/v${pkgver}/mechsim-${pkgver}.tar.gz")
sha256sums=('d811e170c9d4bdafe6ba1d8159a3a90ec4768e7f6edc188387e39840c97e1235')

build() {
  cd "$srcdir/mechsim-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/mechsim-${pkgver}"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
