# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='tarnation'
pkgname="$_pkgname-git"
pkgver='r23.c5d8a17'
pkgrel='1'
pkgdesc='Simple, extensible backup/restore utility based solely on GNU Tar - git version'
arch=('any')
url="https://github.com/kennyparsons/$pkgname"
license=('GPL3')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

_sourcedirectory="$pkgname"

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm755 "$srcdir/$_sourcedirectory/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
