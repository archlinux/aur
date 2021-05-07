# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gyre
pkgver=0.1.1
pkgrel=1
pkgdesc='GTK3 downloader for videos from Coub'
arch=('any')
url='https://github.com/HelpSeeker/Gyre'
license=('GPL3')
depends=('ffmpeg' 'gtk3' 'libhandy' 'python-aiohttp' 'python-gobject')
makedepends=('meson')
source=("https://github.com/HelpSeeker/Gyre/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('6246a53e74cba00d05744ec00c26f6d6b27b9ff6dac815bf0c993f2a4ba94369')

build() {
  arch-meson Gyre-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
