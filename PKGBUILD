# Maintainer: Antun Nitraj <antnitraj@gmail.com>

pkgname=pact-git
_pkgname=${pkgname%-git}
pkgver=r10.ecef660
pkgrel=1
pkgdesc="A simple wrapper for the pacman package manager similar to apt."
arch=('any')
url="https://github.com/antunnitraj/$_pkgname"
license=('GPL')
makedepends=('git')
source=("$_pkgname::git+https://github.com/antunnitraj/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname"
	install -Dm755 ./$_pkgname "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 ./README.md -t "$pkgdir/usr/share/doc/$_pkgname/"
	install -Dm644 ./LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
