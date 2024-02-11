# Maintainer: Typology <mohammedkaabi64@gmail.com>
pkgname=twitch-downloader-gui
pkgver=3.1.0
pkgrel=1
pkgdesc="Twitch VOD/Clip Downloader - Chat Download/Render/Replay - GUI Version"
arch=('x86_64')
url="https://github.com/mohad12211/twitch-downloader-gui"
license=('GPL3')
depends=('ffmpeg' 'libcurl.so' 'twitch-downloader-bin')
makedepends=('make' 'gtk3')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('9e9b63c2c18e79b210795cc8491e306ad61e6c24e32822696f7c1315947d97a79377243a2d2d50c6261248632141fb02e6b2cfe1c13f88b563784554af4a833a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
