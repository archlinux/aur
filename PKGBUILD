pkgname=imagemami
pkgver=0.2.1
pkgrel=1
pkgdesc="ImageMami helps you import, organize and deduplicate your photos. Tauri GUI"
arch=('x86_64')
url="https://github.com/tobo37/ImageMami"
license=('MIT')
depends=('webkit2gtk-4.1') # Wichtige Abhängigkeit für Tauri-Apps auf GTK-Basis
optdepends=()
provides=("${pkgname}")
conflicts=()
source_x86_64=("${pkgname}-${pkgver}.deb::https://github.com/tobo37/ImageMami/releases/download/v0.2.1/imagemami_0.1.2_amd64.deb") # KORRIGIERTE ZEILE
sha256sums_x86_64=('14adaf38ce358149bc06ab0b3630cee2afb5082f029588171b3bd3f50d9abde6')

package() {
    # .deb-Pakete sind 'ar'-Archive, die ein 'data.tar.xz' oder 'data.tar.gz' enthalten
    # Wir extrahieren das Datenarchiv direkt in das Paketverzeichnis
    bsdtar -x -f "${srcdir}/data.tar."* -C "${pkgdir}/"
}
