# Maintainer: Kieran Colford <kieran@kcolford.com>
pkgname=pacman-cycles-git
pkgver=r2.8ba480d
pkgrel=1
pkgdesc="A script to print out installed packages that are part of a dependency cycle."
arch=('any')
url="https://github.com/kcolford/pacman-cycles"
license=('GPL')
groups=()
depends=('bash' 'pacman')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("git+$url")
md5sums=('SKIP')
noextract=()

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 pacman-cycles "$pkgdir/usr/bin/pacman-cycles"
}
