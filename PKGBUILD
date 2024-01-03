# Maintainer: Paul <pb.orzel@proton.me>
pkgname=steam-hdr
pkgver=0.1.0
pkgrel=1
pkgdesc="Add desktop files to launch Steam in a Gamescope session with HDR enabled"
arch=('any')
license=("MIT")
depends=(
  "steam"
  "steam-native-runtime"
  "gamescope"
)
source=(steam_hdr.sh
        steam-native_hdr.sh
        steam_hdr.desktop
        steam-native_hdr.desktop)

sha256sums=("SKIP"
            "SKIP"
            "SKIP"
            "SKIP")

package() {
    cd "$srcdir"
    outdir="$pkgdir/usr/share/steam_hdr"
    mkdir -p $outdir

    install -Dm755 steam_hdr.sh "$outdir/steam_hdr.sh"
    install -Dm755 steam-native_hdr.sh "$outdir/steam-native_hdr.sh"

    outdir="$pkgdir/usr/share/applications/"
    mkdir -p $outdir

    install -Dm755 steam_hdr.desktop "$outdir/steam_hdr.desktop"
    install -Dm755 steam-native_hdr.desktop "$outdir/steam-native_hdr.desktop"
}
