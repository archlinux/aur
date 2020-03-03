# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=fish-humanize-duration-git
_reponame=fish-humanize-duration
pkgver=r7.245e38f
pkgrel=1
pkgdesc='Make a time interval human readable'
arch=(any)
url="https://github.com/fishpkg/$_reponame"
license=(Unlicense)
depends=(fish)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	# Git, no tags available
	cd "$srcdir/$_reponame"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_reponame"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/etc/fish/functions" humanize_duration.fish
}
