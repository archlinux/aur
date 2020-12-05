# Maintainer: Joel Grunbaum <joelgrun@gmail.com
_pkgname=reddit-wallpaper-fetcher
pkgname=$_pkgname-git
pkgver=r8.99c36a7
pkgrel=1
pkgdesc="Automatically fetch images from reddit for a wallpaper"
arch=("x86_64")
url="https://github.com/Chizi123/reddit-wallpaper-fetcher"
license=('MIT')
depends=("jq" "curl" "imagemagick")
makedepends=('git')
source=('git+https://github.com/Chizi123/reddit-wallpaper-fetcher.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgname}"
	install -Dm755 reddit-wallpaper-fetcher "$pkgdir/usr/bin/reddit-wallpaper-fetcher"
	install -Dm644 reddit-wallpaper-fetcher.conf "$pkgdir/usr/share/reddit-wallpaper-fetcher.conf"
}
