# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-gitpulse-git
_pkgname=gitpulse
pkgver=r2.6c74245
pkgrel=1
pkgdesc="Zero-dependency git productivity CLI: see who is shipping, how much and how fast"
arch=('any')
url="https://github.com/milishiajay/gitpulse"
license=('MIT')
depends=('python' 'git')
makedepends=('git')
provides=("python-gitpulse")
conflicts=("python-gitpulse")
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
