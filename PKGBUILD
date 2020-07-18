# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=kak-replace-mode-git
_reponame=replace-mode.kak
pkgver=r9.a569d3d
pkgrel=1
pkgdesc='Replace mode for Kakoune'
arch=(any)
url="https://github.com/alexherbo2/$_reponame"
license=(Unlicense)
depends=(kakoune)
makedepends=(git)
install=$pkgname.install
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_reponame"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_reponame"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/usr/share/kak/rc/addons" rc/replace-mode.kak
}
