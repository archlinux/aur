# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=stb
pkgname=$_pkgname-git
pkgver=r2152.beebb24
pkgrel=1
pkgdesc="Single-file public domain (or MIT licensed) libraries for C/C++"
arch=('any')
url="https://github.com/nothings/stb"
license=('MIT')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/include/$_pkgname stb_*.{c,h}
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
