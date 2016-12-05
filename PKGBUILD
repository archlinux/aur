# Maintainer: Jon Gjengset <jon@thesquareplanet.com
pkgname=staticland-git
pkgver=2.0.2.r18.79d4c00
pkgrel=1
pkgdesc="Publish static sites with this command-line tool & API client for https://static.land"
arch=('any')
url="https://static.land/"
license=('MIT')
makedepends=('git' 'npm')
source=('git+https://github.com/staticland/staticland.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	version=$(grep '"version":' package.json | sed 's/.*"\(.*\)",/\1/')
	printf "%s.r%s.%s" "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	npm install -g --user root --prefix "$pkgdir"/usr
}
