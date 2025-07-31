# Maintainer: Your Name <your.email@example.com>
pkgname=imagemami
pkgver=0.2
pkgrel=1
pkgdesc="A lightning fast image compresser built with Tauri and Rust."
arch=('x86_64')
url="https://github.com/tobo37/ImageMami"
license=('MIT')
depends=('webkit2gtk-4.1') # Wichtige Abhängigkeit für Tauri-Apps auf GTK-Basis
optdepends=()
provides=("${pkgname}")
conflicts=()
source_x86_64=("${pkgname}-${pkgver}.deb::https://github.com/tobo37/ImageMami/releases/download/v0.2/imagemami_0.1.2_amd64.deb") # KORRIGIERTE ZEILE
sha256sums_x86_64=('d9a67bab46d0d0105c5516753d876094cb0bbd2851fa35d8d9818414535e07c4')

package() {
    # .deb-Pakete sind 'ar'-Archive, die ein 'data.tar.xz' oder 'data.tar.gz' enthalten
    # Wir extrahieren das Datenarchiv direkt in das Paketverzeichnis
    bsdtar -x -f "${srcdir}/data.tar."* -C "${pkgdir}/"
}
