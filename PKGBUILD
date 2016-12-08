# Maintainer: Jaume Delclòs <jaume@delclos.com>
pkgname=neet-git
pkgver=r63.87d4719
pkgrel=1
pkgdesc="A script to easily play and manage your anime/drama/series"
arch=(any)
url="https://github.com/onodera-punpun/neet"
license=('GPL')
depends=(fish )
makedepends=('git')
optdepends=('mpv: default media player')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('neet::git+https://github.com/onodera-punpun/neet.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
