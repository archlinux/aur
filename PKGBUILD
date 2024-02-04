# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>
pkgname=git-whoami-git
_pkgname="${pkgname%-git}"
pkgver=r3.5d77e00
pkgrel=2
pkgdesc='The `whoami` command, but for Git. Useful when working with multiple identities.'
arch=("any")
url="https://github.com/petere/git-whoami"
license=("unknown")
depends=("git")
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git#branch=master")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 -t $pkgdir/usr/bin $_pkgname
}
