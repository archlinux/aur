# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=retroarch-assets
pkgname=$_pkgname-git
pkgver=r376.8d114dd5
pkgrel=1
pkgdesc="Assets needed for RetroArch"
arch=('any')
url="https://github.com/libretro/retroarch-assets"
license=('CCPL:by')
groups=('libretro')
makedepends=('git')
optdepends=('retroarch')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	# shellcheck disable=SC2154
	make -C $_pkgname DESTDIR="$pkgdir" install
}
