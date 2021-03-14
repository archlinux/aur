# Maintainer: Westofer Raymond <westoferraymond@gmail.com>

pkgname=ytfzf-git
pkgver=r228.1cd5d69
pkgrel=2
pkgdesc="A posix script to find and watch youtube videos from the terminal. (Without API)"
arch=('any')
url="https://github.com/pystardust/ytfzf"
license=('GPL')
depends=('jq' 'mpv' 'youtube-dl')
makedepends=('git') 
optdepends=('dmenu: use dmenu for search prompts and results'
						'rofi:  use rofi for search prompts and results'
						'fzf:   use fzf for results'
						'ueberzug: thumbnails image preview'
						)
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
	make DESTDIR="$pkgdir/" install
}
