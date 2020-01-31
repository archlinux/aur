# Maintainer: crian <crian84 at gmail dot com>

pkgname=dmenufm-git
pkgver=r189.a132436
pkgrel=1
pkgdesc='A simple file manager using dmenu'
arch=('any')
url="https://github.com/huijunchen9260/dmenufm"
license=('GPL-3.0')
depends=('dmenu' 'xclip' 'wmctrl' 'unrar' 'cabextract' 'unzip' 'p7zip')
makedepends=('git')
provides=('dmenufm')
conflicts=('dmenufm')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/dmenufm"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/dmenufm"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
