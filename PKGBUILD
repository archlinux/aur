# Maintainer: ParsaGP <psrzp1386@gmail.com>
pkgname=beatmapexporter-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="osu!lazer Beatmap Exporter utility"
arch=("x86_64")
url="https://github.com/kabiiQ/BeatmapExporter"
license=("MIT")
depends=()
makedepends=("curl")
options=('!strip')
source=(
    "BeatmapExporter::https://github.com/kabiiQ/BeatmapExporter/releases/download/v${pkgver}/linux-BeatmapExporter"
    "beatmapexporter.desktop"
)
noextract=()
sha256sums=(
    "01301587028e1b7d4208cebf611ee958513cabd176fbc2b19f8bb5c9956e4508"
    "2f806cd13de2f712cdd6bc98d10d50ccd053f47ad585faf8d271a940329b54c4"
)

package() {
    # Move the downloaded binaries to /usr/bin
    install -Dm755 "$srcdir/BeatmapExporter" "$pkgdir/usr/bin/beatmapexporter"

    # Add to desktop entries
    install -Dm 755 "$srcdir/beatmapexporter.desktop" "$pkgdir/usr/share/applications/beatmapexporter.desktop"
}
