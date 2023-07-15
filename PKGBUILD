# Maintainer: chomsky <ivanonarch at tutanota dot com>
# Contributor: Lemon <dev [at] behnamlal [dot] com>
pkgname='lobster-git'
_pkgname='lobster'
pkgver='4.0.0.r19.g7bbd799'
pkgrel=1
pkgdesc="Shell script to watch Movies/TV Shows from the terminal"
arch=('any')
url="https://github.com/justchokingaround/lobster.git"
license=('GPL2')
depends=('grep' 'sed' 'curl' 'fzf' 'mpv' 'html-xml-utils' 'patch')
optdepends=('vlc: An alternative video player', 'ffmpeg: for downloading videos', 'rofi: external launcher', 'ueberzugpp: used for image preview with fzf')
makedepends=('git')
provides=('lobster')
conflicts=('lobster')
source=('lobster::git+https://github.com/justchokingaround/lobster.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/${_pkgname%-VCS}"
    install -Dm755 "./lobster.sh" "$pkgdir/usr/bin/lobster"
}
