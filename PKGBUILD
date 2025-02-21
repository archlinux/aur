# Maintainer: ParsaGP <psrzp1386@gmail.com>
pkgname=beatmapexporter-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="osu!lazer Beatmap Exporter utility"
arch=("x86_64")
url="https://github.com/kabiiQ/BeatmapExporter"
license=("MIT")
depends=()
makedepends=("curl")
provides=("beatmapexporter")
conflicts=("beatmapexporter")
options=('!strip')
source=(
    "BeatmapExporter::https://github.com/kabiiQ/BeatmapExporter/releases/download/v${pkgver}/linux-BeatmapExporter"
    "BeatmapExporterCLI::https://github.com/kabiiQ/BeatmapExporter/releases/download/v${pkgver}/linux-BeatmapExporterCLI"
    "beatmapexporter.desktop"
)
noextract=()
sha256sums=(
    "65365166939870c637fe43ecef6c84e03179111560aed824963a25f6c13cc2f9"
    "db15de6350a898f6f26f69d8ef57c8a4888f692726843d6bc78fa7853769d2f0"
    "2f806cd13de2f712cdd6bc98d10d50ccd053f47ad585faf8d271a940329b54c4"
)

package() {
    # Move the downloaded binaries to /usr/bin
    install -Dm755 "$srcdir/BeatmapExporter" "$pkgdir/usr/bin/beatmapexporter"
    install -Dm755 "$srcdir/BeatmapExporterCLI" "$pkgdir/usr/bin/beatmapexporter-cli"

    # Add to desktop entries
    install -Dm 755 "$srcdir/beatmapexporter.desktop" "$pkgdir/usr/share/applications/beatmapexporter.desktop"
}
