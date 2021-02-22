# Maintainer: Westofer Raymond <westoferraymond@gmail.com>

pkgname=ytfzf-git
pkgver=r50.6865243
pkgrel=1
pkgdesc="A posix script to find and watch youtube videos from the terminal. (With out API)"
arch=('any')
url="https://github.com/pystardust/ytfzf"
license=('GPL')
depends=('jq' 'mpv' 'youtube-dl' 'fzf')
makedepends=('git') 
provides=('ytfzf')
conflicts=("ytfzf")
install=
source=('ytfzf::git+https://github.com/pystardust/ytfzf.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755  -t "${pkgdir}/usr/bin" "${pkgname%-git}"
}
