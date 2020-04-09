# Maintainer: 3ED <krzysztof1987@gmail.com>

pkgname=napi-bash
pkgver=1.1.2
pkgrel=1
pkgdesc="Lightweight, easy and fast polish subtitle downloader from the napiprojekt.pl"
arch=('any')
url="http://3ed.github.io/napi-bash/"
license=('GPL')
depends=('bash>=4.1' 'curl' 'p7zip' 'coreutils' 'findutils')
makedepends=('autoconf' 'automake')
optdepends=('notification-daemon: dla wersji GUI/GTK'
            'dos2unix: konwertowanie znaku konca linii dos/unix'
            'subotage: konwertowanie formatów (nie wymagane dla detekcji)'
            'ffmpeg: detektor FPS dla subotage'
            'mediainfo: detektor FPS dla subotage'
            'mplayer: detektor FPS dla subotage'
            'bc: kalkulator dla ffmpeg')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/3ed/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c8f9c03aa4c1a03e6a2e032d53b6201f2a814d87b8473ad8ff27a2d51a186fbb')

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}
