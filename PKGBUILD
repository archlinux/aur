# Maintainer: Daniel Peukert <daniel@peukert.cc>
_pkgname='tarnation'
pkgname="$_pkgname-git"
pkgver='1.2.0.r0.gc5d8a17'
pkgrel='1'
pkgdesc='Simple, extensible backup/restore utility based solely on GNU Tar - git version'
arch=('any')
url="https://github.com/kennyparsons/$_pkgname"
license=('GPL3')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
sha512sums=('SKIP')

_sourcedirectory="$pkgname"

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	git describe --long --tags | sed -e 's/^v//' -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

package() {
	install -Dm755 "$srcdir/$_sourcedirectory/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
}
