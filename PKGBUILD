# Maintainer: Peter Reschenhofer <peter.reschenhofer@gmail.com>
pkgname=gnome-shell-extension-remmina-search-provider
_pkgname=${pkgname%-git}

pkgver=r48.360ea9a
pkgrel=1
pkgdesc="Remmina Search Provider"
arch=('any')
url="https://github.com/alexmurray/remmina-search-provider"
license=('GPL')
depends=('gnome-shell' 'remmina')
makedepends=('git')
source=("git+https://github.com/alexmurray/remmina-search-provider")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/remmina-search-provider"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions"
	mv remmina-search-provider  "$pkgdir/usr/share/gnome-shell/extensions/remmina-search-provider@alexmurray.github.com"
}
