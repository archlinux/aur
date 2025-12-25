# Maintainer: Nero Blackstone <gf7600gs@gmail.com>

pkgname=numaplayer
pkgver=2.1.8
pkgrel=1
pkgdesc="Set your music and inspiration totally free."
arch=('x86_64')
url="https://www.studiologic-music.com/products/numaplayer"
license=('custom:proprietary')
depends=('alsa-lib' 'fontconfig' 'freetype2' 'curl' 'gcc-libs')
source=("https://www.studiologic-music.com/api/get-files/NumaPlayer_${pkgver}.deb")
sha256sums=('e86550e0a897f72e28743afce64a8dfb79193fbf8073f5be9676e62e227faefd')

prepare() {
    cd "$srcdir"
    ar x NumaPlayer_${pkgver}.deb
    tar -xf data.tar.*
    find . -type d -exec chmod 755 {} +
    find . -type f -exec chmod 644 {} +
    chmod 755 ./usr/bin/Numa\ Player
    chmod 755 ./usr/lib/vst3/Numa\ Player.vst3/Contents/x86_64-linux/Numa\ Player.so
}

package() {
    cd "$srcdir"
    cp -r usr "$pkgdir/"
}
