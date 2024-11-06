pkgname=smbx
_pkgname=SMBX
pkgver=1.3.6.6
pkgrel=2
pkgdesc="Super Mario Bros. X is a Mario fan game originally made by Andrew Spinks in the year 2009 and supported by him up to 2011. This game combines various aspects of Super Mario Bros."
arch=('pentium4' 'i386' 'i686' 'x86_64' 'aarch64')
url="https://github.com/Wohlstand/TheXTech"
license=('GPL')
depends=('thextech-bin' 'wget' 'unzip' 'yad')
makedepends=('unzip')
source=("smbx.desktop" "smbx.png" "$url/releases/download/v$pkgver/thextech-smbx13-assets-full-v$pkgver.7z")
sha256sums=('e3818bca7274d688752bc25a0bfc13e6bc353b5a9024fa3f1ce0957e0c94ea7b'
            'b26f45a3beceb40a8e98c29ab4c9c8a8d3348cac411ba9dfa19573207ef7ee1a'
            '9b74471abd53b0cb8f2ec63f928235b0eb460467c86392a4384ddeec808060c0')

package() {
    install -dm775 "$pkgdir/usr/games/thextech/assets/smbx"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm644 "$pkgdir/usr/share/applications"

    # Packaging files
    cd "$srcdir"
    rm -rf thextech-smbx13-assets-full-v$pkgver.7z
    install -Dm755 "smbx.desktop" "$pkgdir/usr/share/applications"
    install -Dm644 "smbx.png" "$pkgdir/usr/share/pixmaps"
    cp -r * "$pkgdir/usr/games/thextech/assets/smbx"
}
