# Maintainer: Thibaut Pérami <thibaut.perami@ens.fr>
# Contributor: Bill Sun <capsensitive at gmail dot com>

pkgname=gpdfx-ng-git
pkgver=r22.c42ef90
pkgrel=2
pkgdesc="A graphical tool to extract parts of a PDF as a PDF. Successor of gpdfx"
arch=('any')
url="https://github.com/yishilin14/gpdfx-ng"
license=('GPL3')
depends=("python" "python-gobject" "python-cairo" "poppler-glib" "texlive-core" "gtk3")
makedepends=('git')
source=('gpdfx-ng::git+https://github.com/yishilin14/gpdfx-ng#branch=master')
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
