# Maintainer: Typology <mohammedkaabi64@gmail.com>
pkgname=twitch-downloader-gui
pkgver=2.0.0
pkgrel=1
pkgdesc="Twitch VOD/Clip Downloader - Chat Download/Render/Replay - GUI Version"
arch=('x86_64')
url="https://github.com/mohad12211/twitch-downloader-gui"
license=('GPL3')
depends=('ffmpeg' 'libcurl.so' 'twitch-downloader-bin')
makedepends=('make' 'gtk3')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('159bce95c5128a6451a436a89fb1ff68438b79428321b946a63ee5d08508b21dd051ba8df776d6bb2ddf1ddb5ad35931f327fdb7896a5967e7c383e67356a213')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
