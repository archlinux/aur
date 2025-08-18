# Maintainer: fk29g <fk29g.uphill912@slmails.com>
_projectname=cpond
pkgname=${_projectname}-git
pkgver=r24.1f91080
pkgrel=1
pkgdesc="Procedurally animated fish for your terminal"
arch=("x86_64")
url="https://github.com/ayuzur/cpond"
license=("MIT")
depends=("ncurses")
makedepends=("git")
provides=("$_projectname")
conflicts=("$_projectname")
source=("git+$url.git")
sha256sums=("SKIP")

pkgver() {
	cd "$_projectname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
	cd "$_projectname"
	make
}

package() {
	cd "$_projectname"
    install -Dm 755 $_projectname $pkgdir/usr/bin/$_projectname
    install -Dm 644 LICENSE $pkgdir/usr/share/licenses/${_projectname}/LICENSE
}
