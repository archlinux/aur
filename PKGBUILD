# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-termdiff-git
_pkgname=termdiff
pkgver=r1.e2f92ba
pkgrel=1
pkgdesc="Pretty terminal diff viewer with side-by-side and unified modes"
arch=('any')
url="https://github.com/milishiajay/termdiff"
license=('custom:none-declared')
depends=('python')
makedepends=('git')
provides=("python-termdiff")
conflicts=("python-termdiff")
source=("$_pkgname::git+$url.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "$_pkgname"
	install -Dm755 "$_pkgname.py" "$pkgdir/usr/bin/$_pkgname"
}
