# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=sdl-gamecontrollerdb
pkgname=$_pkgname-git
pkgver=r1420.9d09945
pkgrel=1
pkgdesc="A community sourced database of game controller mappings to be used with SDL2 Game Controller functionality"
arch=('any')
url="https://github.com/mdqinc/SDL_GameControllerDB"
license=('Zlib')
makedepends=('git')
optdepends=('sdl2' 'sdl3')
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
	install -Dm644 -t "$pkgdir"/usr/share/sdl gamecontrollerdb.txt
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
