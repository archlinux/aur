# Maintainer: raycekar <n/a. All contact through github>

pkgname=ppac-git
pkgver=0.1
pkgrel=1
pkgdesc="A package installer/updater helper."
arch=('any')
url="https://github.com/raycekar/ppac.git#branch=aurRelease"
license=('GPL3')
depends=('pacman')
makedepends=('gcc')
optdepends=('yay: replacment for pacman' 
            'paru: replacment for pacman')
source=("git+$url")
md5sums=("SKIP")

pkgver() {
	cd ppac
	printf "0.1.r%s" "$(git rev-list --count HEAD)"
}

build() {
	cd ppac
	gcc -g *.c -o ppac
}

package() {
	cd ppac
	install -Dm755 ppac "$pkgdir/usr/bin/ppac"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
