# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>
pkgname=git-whoami-git
pkgver=r3.5d77e00
pkgrel=1
pkgdesc='The `whoami` command, but for Git. Useful when working with multiple identities.'
arch=("any")
url="https://github.com/petere/git-whoami"
license=("unknown")
depends=("git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/petere/git-whoami.git#branch=master")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 git-whoami $pkgdir/usr/bin/git-whoami
}
