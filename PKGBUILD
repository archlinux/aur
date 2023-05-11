pkgname=mpv-uosc
pkgver=4.7.0
pkgrel=1
pkgdesc="Feature-rich minimalist proximity-based UI for MPV player."
arch=("any")
url="https://github.com/tomasklaen/uosc"
license=("GPL3")
optdepends=(
    "mpv-thumbfast: for showing thumbnails on-the-fly on seek"
)
makedepends=("git")
source=(
    "git+${url}.git#tag=${pkgver}"
)
sha256sums=(
    'SKIP'
)

package(){
    depends=("mpv")
    cd "${srcdir}/uosc"
    mkdir -p "${pkgdir}/usr/share/mpv/"{scripts,script-opts,fonts}
    cp -a scripts/* "${pkgdir}/usr/share/mpv/scripts/"
    install -Dm644 script-opts/uosc.conf "${pkgdir}/usr/share/mpv/script-opts/uosc.conf"
    for font in uosc_icons.otf uosc_textures.ttf
    do
        install -Dm644 fonts/${font} "${pkgdir}/usr/share/mpv/fonts/${font}"
    done
}
