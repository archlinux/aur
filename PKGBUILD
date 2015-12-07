# Maintainer: Christoph Seitz <christoph.seitz@posteo.de>
pkgname=git-fire-git
pkgver=r43.7284b9c
pkgrel=1
pkgdesc="A Git plugin that helps in the event of an emergency."
arch=(any)
url="https://github.com/qw3rtman/git-fire"
license=('MIT')
depends=('git')
makedepends=('git')
provides=('git-fire')
conflicts=('git-fire')
source=('git+https://github.com/qw3rtman/git-fire.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "$pkgdir/usr/bin/"
  cp git-fire "$pkgdir/usr/bin/"
}
