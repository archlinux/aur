# Maintainer: Bill Sun <capsensitive at gmail dot com>

pkgname=gpdfx-ng-git
pkgver=r22.c42ef90
pkgrel=1
pkgdesc="gpdfx-ng is a GTK application written in Python using the Poppler library to render the PDF."
arch=('any')
url="https://github.com/yishilin14/gpdfx-ng"
license=('GPL3')
depends=("python" "python-gobject" "python-cairo" "poppler-glib" "texlive-core")
makedepends=('git')
source=('git+https://github.com/yishilin14/gpdfx-ng')
noextract=()
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"
    # Git, tags available
	#printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
    install -Dm 755 src/gpdfx-ng "$pkgdir"/usr/bin/gpdfx-ng
}
