# Maintainer: Richard Fakenberg (OK1BR) <rifak@protonmail.com>
# AUR package for the tagged release.
pkgname=sdr-for-linux
_pkgtag=0.2.0
pkgver=0.2.0
pkgrel=1
pkgdesc="Modern GTK4 SDR application for HPSDR / ANAN transceivers (piHPSDR engine, WDSP)"
arch=('x86_64' 'aarch64')
url="https://github.com/OK1BR/sdr-for-linux"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'fftw' 'opus' 'openssl' 'zlib' 'libpipewire'
         'libwebsockets')
makedepends=('meson')
source=("$pkgname-$_pkgtag.tar.gz::$url/archive/refs/tags/v$_pkgtag.tar.gz")
sha256sums=('c19aa42ffd412d85a35468d7dc706922759dc3020ffaea31fe44f70302c32735')

build() {
  arch-meson "$pkgname-$_pkgtag" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
