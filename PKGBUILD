pkgname=imagemami
pkgver=0.2.3
pkgrel=1
pkgdesc="ImageMami helps you import, organize and deduplicate your photos. Tauri GUI"
arch=('x86_64')
url="https://github.com/tobo37/ImageMami"
license=('MIT')
depends=('webkit2gtk-4.1') # Wichtige Abhängigkeit für Tauri-Apps auf GTK-Basis
optdepends=()
provides=("${pkgname}")
conflicts=()
source_x86_64=("${pkgname}-${pkgver}.deb::https://github.com/tobo37/ImageMami/releases/download/v0.2.3/imagemami_0.2.3_amd64.deb") # KORRIGIERTE ZEILE
sha256sums_x86_64=('0fd038b64129aad390f892ff41b06870f052522b3d56508d404441f6c55bf5c2')

package() {
    # .deb-Pakete sind 'ar'-Archive, die ein 'data.tar.xz' oder 'data.tar.gz' enthalten
    # Wir extrahieren das Datenarchiv direkt in das Paketverzeichnis
    bsdtar -x -f "${srcdir}/data.tar."* -C "${pkgdir}/"
}
