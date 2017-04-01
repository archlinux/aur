# Maintainer: Johan Förberg <johan@forberg.se>
pkgname=openxcom-music-sycraft
pkgver=6.0
pkgrel=1
pkgdesc='Remixed soundtrack by Sycraft for use with OpenXcom'
arch=(any)
url=http://sycraft.org/content/audio/xcom.shtml
depends=(openxcom)
install=openxcom-music-sycraft.install
license=(custom)

source=(http://sycraft.org/content/audio/xcom/sycraft-xcom-ogg.zip)
sha1sums=('ce71c24495c808a74ee33e00e9b80bfe496c1a97')

prepare() {
    cd "$srcdir"

    # Extract 'license' part of readme per Arch packaging standards.
    sed -n '1,2p; 20,23p' Sycraft_music_readme.txt > LICENSE
}

package() {
    cd "$srcdir"

    install -Dm644 *.ogg Sycraft_music_readme.txt -t "$pkgdir/usr/share/openxcom/UFO/SOUND"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
