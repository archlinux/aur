# Maintainer: Typology <mohammedkaabi64@gmail.com>
pkgname=twitch-downloader-gui
pkgver=1.0
pkgrel=1
pkgdesc="Twitch VOD/Clip Downloader - Chat Download/Render/Replay - GUI Version"
arch=('x86_64')
url="https://github.com/mohad12211/twitch-downloader-gui"
license=('GPL3')
depends=('ffmpeg' 'curl' 'twitch-downloader-bin')
makedepends=('make')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a290af36fb0a335fdcd8f7e4a172d1ad6e433365d936ecd23f3e3decb8c97cd19e66190a36573cd8e98da628c04f3a84311e185c50e09c856d5407ac623168bb')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
