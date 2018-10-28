# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=ffaudioconverter
pkgver=0.5
pkgrel=2
pkgdesc="Simple FFmpeg DnD GUI for converting audio files"
arch=('i686' 'x86_64')
url="https://github.com/Bleuzen/FFaudioConverter/"
license=(MIT)
depends=('qt5-base' 'ffmpeg')
source=("https://github.com/Bleuzen/FFaudioConverter/releases/download/v$pkgver/FFaudioConverter-$pkgver.tar.xz"
        "$pkgname-LICENSE::https://raw.githubusercontent.com/Bleuzen/FFaudioConverter/master/LICENSE")
sha256sums=('f20952c459a48776b29b13c19211e56bda0770135ff1bcc471f54f1d7f91f9e9'
            '874f26a02f71289a8ed6d69708ba8ee3ee27b3b13615cb99a09f5f74f76c1673')

build() {
  ./build.sh
}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install -D build/dist/FFaudioConverter "$pkgdir/usr/bin/ffaudioconverter"
  install -D $pkgname-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
