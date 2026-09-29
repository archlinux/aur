# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
# Maintainer: KafCoppelia <k740677208@gmail.com>

_pkgname=bemoji
pkgname=${_pkgname}-git
pkgver=r104.791c774
pkgrel=1
pkgdesc="Emoji picker that remembers your favorites, with support for bemenu/wofi/rofi/dmenu and wayland/X11."
arch=('any')
url="https://github.com/marty-oehme/bemoji"
license=('MIT')
optdepends=(
    'bemenu: Emoji picker menu'
    'rofi: Emoji picker menu'
    'dmenu: Emoji picker menu'
    'wl-clipboard: For copying to clipboard'
    'xclip: For copying to clipboard'
    'wtype: For typing selected emoji'
    'xdotool: For typing selected emoji'
)
makedepends=('git')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${_pkgname}
    install -Dm644 -t ${pkgdir}/usr/share/licenses/${pkgname} LICENSE
    install -Dm755 -t ${pkgdir}/usr/bin ${_pkgname}
}
