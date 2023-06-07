pkgname=mpv-thumbfast-noenabled-git
pkgver=r123.g6f1d92d
pkgrel=1
pkgdesc="High-performance on-the-fly thumbnailer script for mpv, disabled by default"
provides=("mpv-thumbfast" "mpv-thumbfast-git")
conflicts=("mpv-thumbfast" "mpv-thumbfast-git")
arch=("any")
url="https://github.com/po5/thumbfast"
license=("GPL3")
makedepends=("git")
source=(
    "git+${url}.git"
)
sha256sums=(
    'SKIP'
)

pkgver() {
    cd "${srcdir}/thumbfast"
    echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}
package(){
    depends=("mpv")
    cd "${srcdir}/thumbfast"
    mkdir -p "${pkgdir}/usr/share/mpv/"{scripts,script-opts}
    install -Dm644 thumbfast.lua "${pkgdir}/usr/share/mpv/scripts/thumbfast.lua"
    install -Dm644 thumbfast.conf "${pkgdir}/usr/share/mpv/script-opts/thumbfast.conf"
}

