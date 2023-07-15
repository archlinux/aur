# Maintainer: chomsky <ivanonarch at tutanota dot com>
# Contributor: Lemon <dev [at] behnamlal [dot] com>
pkgname='lobster-git'
pkgver='4.0.0.r19.g7bbd799'
_pkgname="${pkgname%-git}"
pkgrel=1
pkgdesc="Shell script to watch Movies/TV Shows from the terminal"
arch=('any')
url="https://github.com/justchokingaround/lobster.git"
license=('GPL2')
depends=('grep' 'sed' 'curl' 'fzf' 'mpv' 'html-xml-utils' 'patch')
optdepends=('vlc: An alternative video player', 'ffmpeg: for downloading videos', 'rofi: external launcher', 'ueberzugpp: used for image preview with fzf')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 "./lobster.sh" "$pkgdir/usr/bin/lobster"
}
