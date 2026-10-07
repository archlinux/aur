# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-certlint-git
_pkgname=certlint
pkgver=r1.bf5c09b
pkgrel=1
pkgdesc="Check SSL/TLS certificates for expiry and chain issues"
arch=('any')
url="https://github.com/milishiajay/certlint"
license=('custom:none-declared')
depends=('python')
makedepends=('git')
provides=("python-certlint")
conflicts=("python-certlint")
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
