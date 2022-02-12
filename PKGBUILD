pkgname=rapd
pkgver=0.1.2
pkgrel=0
pkgdesc="Rust Audio Player Daemon"
arch=(any)
url="https://rapd.readthedocs.io/en/latest/"
license=('GPL-3.0')
makedepends=('rust' 'cmake')
optdepends=('pulseaudio: Pulse audio playback' 'alsa-lib: Alsa audio playback')
source=($pkgname-$pkgver.tar.gz)
sha256sums=("309afa1d0962ac63355b9ce0c440c8768da31237645a8b142c3a0309968ccf40")

build() {
  cd "$pkgname-$pkgver"
  sh ./install.sh --build-release
}

package() {
  cd "$pkgname-$pkgver"
  export RAPD_INSTALL_ROOT=$pkgdir
  sh ./install.sh --install-release
}
