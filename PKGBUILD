# Maintainer: Albert Berger < nbdspcl at gmail dot com>
pkgname=pacliner-git
pkgver=0.1.r1
pkgrel=1
pkgdesc="Archlinux package management helper."
arch=('any')
url="https://github.com/nbdsp/pacliner.git"
license=('GPL')
groups=()
depends=('bash','perl')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+$url#branch=master")
noextract=()
md5sums=('SKIP')


pkgver() {
	cd "${pkgname%-git}"

	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "${pkgname%-git}"
	install -Dm755 "${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"	
}
