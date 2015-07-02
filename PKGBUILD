# Maintainer: 3ED <krzysztof1987@gmail.com>

pkgname=napi-bash
pkgver=1.0.0
pkgrel=1
pkgdesc="Lightweight, easy and fast polish subtitle downloader from the napiprojekt.pl"
arch=('any')
url="http://3ed.github.io/napi-bash/"
license=('GPL')
depends=('bash>=4.1' 'curl' 'p7zip' 'coreutils' 'findutils')
optdepends=('notification-daemon: dla wersji GUI/GTK'
            'dos2unix: konwertowanie znaku konca linii dos/unix'
            'subotage: konwertowanie formatów (nie wymagane dla detekcji)'
            'ffmpeg: detektor FPS dla subotage'
            'mediainfo: detektor FPS dla subotage'
            'mplayer: detektor FPS dla subotage'
            'bc: kalkulator dla ffmpeg')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/3ed/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('695b2d39a82fa1ad348cbae2ba0cb5425a9a59934ac718635f8455ba0903e26b')

# Mirror: http://napi-bash.googlecode.com/archive/v${pkgver}.tar.gz (sums will not mach)

package() {
  cd "$pkgname-$pkgver"
  make install PREFIX="/usr" DESTDIR="$pkgdir"
}
