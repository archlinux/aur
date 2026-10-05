# Maintainer: ParsaGP <psrzp1386@gmail.com>
pkgname=beatmapexporter-bin
pkgver=2.8.0
pkgrel=1
pkgdesc="osu!lazer Beatmap Exporter utility"
arch=("x86_64")
url="https://github.com/kabiiQ/BeatmapExporter"
license=("MIT")
depends=()
options=('!strip')
source=(
    "BeatmapExporter::https://github.com/kabiiQ/BeatmapExporter/releases/download/v${pkgver}/linux-BeatmapExporter"
    "beatmapexporter.desktop"
)
noextract=()
sha256sums=(
    "2162fed69eaa301f252ea4e55d02cdbae0b88f00885e43c0c975abf41c012a09"
    "e506354a746daf7fe842c7c5a79034dc4677b1efc3784683bfcfdbc38d6e2365"
)

package() {
    # Move the downloaded binaries to /usr/bin
    install -Dm755 "$srcdir/BeatmapExporter" "$pkgdir/usr/bin/beatmapexporter"

    # Add to desktop entries
    install -Dm 755 "$srcdir/beatmapexporter.desktop" "$pkgdir/usr/share/applications/beatmapexporter.desktop"
}
