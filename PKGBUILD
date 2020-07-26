# Maintainer: oakszyjrnrdy <oakszyjrnrdy at outlook dot com>
_pkgname="betterlockscreen_rapid"
pkgname="$_pkgname-git"
pkgver=r4.b257eae
pkgrel=1
pkgdesc="A rapid and good-looking screen locker"
arch=("any")
url="https://github.com/oakszyjrnrdy/$_pkgname"
license=("MIT")
depends=(
	"i3lock-color"
	"i3lock-fancy-rapid-git"
)
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=("etc/$_pkgname.conf")
source=("$pkgname::git+$url")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m 755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -D -m 644 "$_pkgname.conf" "$pkgdir/etc/$_pkgname.conf"
	install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
