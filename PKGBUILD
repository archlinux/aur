# Maintainer: crian <crian84 at gmail dot com>

pkgname=dmenufm-git
pkgver=2.0.r0.ge658354
pkgrel=1
pkgdesc='A simple file manager using dmenu'
arch=('any')
url="https://github.com/huijunchen9260/dmenufm"
license=('GPL-3.0')
depends=('dmenu' 'xclip' 'wmctrl' 'unrar' 'cabextract' 'unzip' 'p7zip')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
