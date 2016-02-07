# Maintainer: Adrian Freund <freundadrian@gmail.com>
_pkgname=xuserrun
pkgname=$_pkgname-dbus-git
pkgver=r7.e2b13c5
pkgrel=1
pkgdesc="Run commands as the currently-active X11 user while also using his dbus-session"
arch=('any')
url="https://github.com/freundTech/xuserrun"
license=('custom:UNLICENSE')
depends=('systemd')
makedepends=('git')
provides=('xuserrun')
conflicts=('xuserrun')
source=("$_pkgname::git+https://github.com/freundTech/xuserrun.git")
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
