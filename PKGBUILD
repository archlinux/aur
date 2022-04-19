# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="ultimmc-bin"
pkgver=nightly
pkgrel=2
pkgdesc="Free, open source launcher and instance manager for Minecraft"
url="https://github.com/AfoninZ/MultiMC5-Cracked"
license=("custom")
arch=("x86_64")
provides=("ultimmc")
depends=("java-runtime" "libgl" "qt5-base" "zlib")
optdepends=("jre8-openjdk: java for minecraft < 1.17"
            "jre-openjdk: java for minecraft >= 1.17"
            "jprofiler: performance metrics"
            "mcedit-unified: world editor")
source=("$pkgname-$pkgver.zip::https://nightly.link/AfoninZ/UltimMC/workflows/main/develop/mmc-cracked-lin64.zip"
        "ultimmc.svg"
        "ultimmc.desktop"
        "ultimmc")
sha256sums=("SKIP"
            "8c2c1ff1f4ce4ca7a7453ec1f7f666087f4319db7c654f81a7827a34f0c17e33"
            "65ce52f857d84fb7c6f1c615ac06e8bbfb8d3ad6e6352b818d500b99de733ad0"
            "054961d8373913919e5fda6d2c8cbb7301cfad16bc0347928b5d04ebbe0ce4e0")

package(){
 cd "UltimMC/bin"
 find -type f -exec \
  install -D -m 644 {} "$pkgdir/usr/lib/ultimmc/"{} \;
 find "$pkgdir" -type f \( -name "*.so" -o -name "UltimMC" \) -exec \
  chmod +x {} \;
 install -D -m 644 "$srcdir/ultimmc.svg" "$pkgdir/usr/share/pixmaps/ultimmc.svg"
 install -D -m 644 "$srcdir/ultimmc.desktop" "$pkgdir/usr/share/applications/ultimmc.desktop"
 install -D -m 755 "$srcdir/ultimmc" "$pkgdir/usr/bin/ultimmc"
}
