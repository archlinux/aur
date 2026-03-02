# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
pkgname=flag.h-git
_pkgname=${pkgname%-git}
pkgver=r53.7d36992
pkgrel=2
pkgdesc="Command-line flag parsing in C"
arch=('any')
url="https://github.com/tsoding/flag.h"
license=('MIT')
depends=()
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!debug')
source=('git+https://github.com/tsoding/flag.h.git')
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname"

	install -Dm644 flag.h "$pkgdir/usr/include/flag.h"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
