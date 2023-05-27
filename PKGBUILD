# Maintainer: chomsky <ivanonarch at tutanota dot com>
pkgname='lobster-git'
_pkgname='lobster'
pkgver='r83.af89b22'
pkgrel=1
pkgdesc="Shell script to watch Movies/TV Shows from the terminal"
arch=('any')
url="https://github.com/justchokingaround/lobster.git"
license=('GPL2')
depends=('grep' 'sed' 'curl' 'fzf' 'mpv' 'html-xml-utils' 'patch')
optdepends=('vlc: An alternative video player', 'ffmpeg: for downloading videos', 'rofi: external launcher', 'socat: for interacting with the mpv socket, used for the history feature')
makedepends=('git')
provides=('lobster')
conflicts=('lobster')
source=('lobster::git+https://github.com/justchokingaround/lobster.git')
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/${_pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd "$srcdir/${_pkgname%-VCS}"
        install -Dm755 "./lobster.sh" "$pkgdir/usr/bin/lobster"
}
