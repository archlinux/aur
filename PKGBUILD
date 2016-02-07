# Maintainer: Adrian Freund <freundadrian@gmail.com>
_pkgname=xuserrun
pkgname=$_pkgname-git
pkgver=r6.de60127
pkgrel=1
pkgdesc="Run commands as the currently-active X11 user"
arch=('any')
url="https://github.com/rephorm/xuserrun"
license=('custom:UNLICENSE')
depends=('systemd')
makedepends=('git')
provides=('xuserrun')
conflicts=('xuserrun')
source=("$_pkgname::git+https://github.com/rephorm/xuserrun.git")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
