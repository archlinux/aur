# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=ffaudioconverter
pkgver=0.10.0
pkgrel=1
pkgdesc="Simple FFmpeg DnD GUI for converting audio files"
arch=('i686' 'x86_64')
url="https://github.com/Bleuzen/FFaudioConverter/"
license=(MIT)
depends=('qt5-base' 'ffmpeg')
source=("https://github.com/Bleuzen/FFaudioConverter/releases/download/v$pkgver/FFaudioConverter-$pkgver.tar.xz"
        "$pkgname-LICENSE::https://raw.githubusercontent.com/Bleuzen/FFaudioConverter/master/LICENSE")
sha256sums=('39590364a35c2203f37359a7d081e825ddbd034baf474250c80a2ca9900836a5'
            '874f26a02f71289a8ed6d69708ba8ee3ee27b3b13615cb99a09f5f74f76c1673')

build() {
  ./build.sh
}

package() {
  install -D build/dist/ffaudioconverter "$pkgdir/usr/bin/ffaudioconverter"
  install -D $pkgname-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  mkdir -p "$pkgdir/usr/share/applications/"
  install -D ffaudioconverter.desktop "${pkgdir}/usr/share/applications/"
  
  mkdir -p "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
  install -Dm644 ffaudioconverter.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/"
}
