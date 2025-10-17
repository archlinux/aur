# Maintainer: ParsaGP <psrzp1386@gmail.com>
pkgname=beatmapexporter-bin
pkgver=2.6.1
pkgrel=3
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
    "67c14bf242d302b05d466339d54f89e96b2b2477e9cde68367c6c3bd8f8fa49e"
    "e506354a746daf7fe842c7c5a79034dc4677b1efc3784683bfcfdbc38d6e2365"
)

package() {
    # Move the downloaded binaries to /usr/bin
    install -Dm755 "$srcdir/BeatmapExporter" "$pkgdir/usr/bin/beatmapexporter"

    # Add to desktop entries
    install -Dm 755 "$srcdir/beatmapexporter.desktop" "$pkgdir/usr/share/applications/beatmapexporter.desktop"
}
