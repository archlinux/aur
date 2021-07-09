# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=libretro-database
pkgname=$_pkgname-git
pkgver=1.9.5.r3.g658a2c29
pkgrel=1
epoch=1
pkgdesc="RetroArch's cheatcode files, content data files, etc."
arch=('any')
url="https://github.com/libretro/libretro-database"
license=('MIT')
groups=('libretro')
makedepends=('git')
optdepends=('retroarch')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	# shellcheck disable=SC2154
	make -C $_pkgname DESTDIR="$pkgdir" install
}
