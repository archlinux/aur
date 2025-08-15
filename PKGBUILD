# Maintainer: Sezer Karaoğlan <szrkrgln007@gmail.com>
pkgname=mini-media-player
pkgver=1.0
pkgrel=3
pkgdesc="Mini Media Player - Python / Tkinter / VLC based media player"
arch=('x86_64')
url="https://github.com/sezer/mini-media-player"
license=('GPL')
depends=('python' 'python-pillow' 'vlc')
makedepends=('python-pip')
source=("mini-media-player.py")
sha256sums=('8b22324e8b34ccfa7ced309e07b76f0aa0c2914c1893c830fe7b5c64b77920a1')

package() {
    # Dosyayı /usr/bin/mini-media-player olarak kur
    install -Dm755 "${srcdir}/mini-media-player.py" "$pkgdir/usr/bin/mini-media-player"

    # Shebang ekle ki python3 ile çalışsın
    sed -i '1s|^.*$|#!/usr/bin/env python3|' "$pkgdir/usr/bin/mini-media-player"
}
