pkgname=mpv-memo-git
pkgver=r39.g6ba93c7
pkgrel=1
pkgdesc="A recent files menu for mpv"
provides=("mpv-memo")
conflicts=("mpv-memo")
arch=("any")
url="https://github.com/po5/memo"
license=("GPL3")
makedepends=("git")
source=(
    "git+${url}.git"
)
sha256sums=(
    'SKIP'
)

pkgver() {
    cd "${srcdir}/memo"
    echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}
package(){
    depends=("mpv")
    cd "${srcdir}/memo"
    mkdir -p "${pkgdir}/usr/share/mpv/"{scripts,script-opts}
    install -Dm644 memo.lua "${pkgdir}/usr/share/mpv/scripts/memo.lua"
    install -Dm644 memo.conf "${pkgdir}/usr/share/mpv/script-opts/memo.conf"
}

