# Maintainer: Philipp A. <flying-sheep@web.de>

_name=git-archive-all
pkgname=$_name-git
pkgver=r44.af81ea7
pkgrel=1
pkgdesc='Wrapper for git-archive that archives a git superproject and its submodules'
arch=(any)
url="https://github.com/meitar/$_name.sh"
license=(GPLv3)
depends=(git)
provides=($_name)
conflicts=($_name)
source=("git+$url.git")
md5sums=(SKIP)

pkgver() {
	cd "$_name.sh"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm755 "$_name.sh/$_name.sh" "$pkgdir/usr/bin/$_name"
}
