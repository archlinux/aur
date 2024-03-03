# Maintainer: chomsky <ivanonarch at tutanota dot com>
# Contributor: Lemon <dev [at] behnamlal [dot] xyz>
pkgname='lobster-git'
_pkgname="${pkgname%-git}"
pkgver=r203.f9294ff
pkgrel=1
pkgdesc="Shell script to watch Movies/Webseries/Shows from the terminal."
arch=('any')
url="https://github.com/justchokingaround/lobster.git"
license=('GPL2')
makedepends=('git')
depends=('grep' 'sed' 'curl' 'fzf' 'mpv' 'html-xml-utils' 'patch')
optdepends=('vlc: An alternative video player', 'ffmpeg: for downloading videos', 'rofi: external launcher', 'ueberzugpp: used for image preview with fzf')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 "./lobster.sh" "$pkgdir/usr/bin/lobster"
}
