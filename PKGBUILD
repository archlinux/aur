# Maintainer: Kyuunex <kyuunex at protonmail dot ch>

pkgname=mapset-verifier-bin
pkgver=2.0.0
pkgrel=0

pkgdesc="A modding tool for osu!"
arch=("x86_64")
url="https://github.com/Naxesss/MapsetVerifier"

provides=(mapset-verifier)
conflicts=(mapset-verifier)

options=(!strip !debug)

source=(
    "https://github.com/Naxesss/MapsetVerifier/releases/download/v$pkgver/Mapset-Verifier-$pkgver.AppImage"
    "mapset-verifier.desktop"
    "mapset-verifier-icon.png"
)

sha256sums=('a2c169585503d6670acf48f9f0c405e6c158f465f9b6b71b708b5af4bc40979d'
            '2492d6899f2c3e856cc9499e0557acae8d7b1d5eb6fb9d14bc55ac3c3de4a3e9'
            '9e1730dabd75d584829e48bc879d53d649254fec35263e569dd6b2334325e982')

package()
{
    # add .desktop file for it to appear in the start menu
    mkdir -p "$pkgdir/usr/share/applications"
    install -m644 "$srcdir/../mapset-verifier.desktop" "$pkgdir/usr/share/applications/mapset-verifier.desktop"

    # application icon for the start menu entry
    mkdir -p "$pkgdir/usr/share/pixmaps"
    install -m644 "$srcdir/mapset-verifier-icon.png" "$pkgdir/usr/share/pixmaps/mapset-verifier.png"

    # install the appimage
    mkdir -p "$pkgdir/usr/bin"
    install -m755 "$srcdir/Mapset-Verifier-$pkgver.AppImage" "$pkgdir/usr/bin/mapset-verifier"
}
