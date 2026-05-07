# Maintainer: nero4kan <vegomdoster@gmail.com>
pkgname=white-music-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Yandex Music mod (White Music) with bottom search and clean UI"
arch=('x86_64')
url="https://github.com/nerolocker/whitemusic"
license=('MIT')
depends=('nss' 'alsa-lib' 'gtk3' 'libxss' 'libnm')
provides=('white-music')
conflicts=('white-music')

source=("https://github.com/nerolocker/whitemusic/releases/download/Release/white-music.tar.gz")

sha256sums=('SKIP' 'SKIP')

package() {
    install -dm755 "$pkgdir/opt/$pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"

    cp -r "$srcdir/"* "$pkgdir/opt/$pkgname/"

    ln -s "/opt/$pkgname/whitemusic" "$pkgdir/usr/bin/white-music"

    if [ -f "white-music.desktop" ]; then
        install -m644 "white-music.desktop" "$pkgdir/usr/share/applications/"
    fi
}
