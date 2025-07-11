# Maintainer: Bart Libert <bart plus aur at liber dot email>
_pkgname=ndrop
pkgname=$_pkgname-git
pkgver=r5.12c4f87
pkgrel=1
pkgdesc="Run, show and hide programs via keybind in niri"
arch=(any)
url="https://github.com/Schweber/ndrop"
license=('AGPL-3.0-only')
depends=('bash' 'niri' 'jq')
makedepends=('git' 'scdoc')
provides=($_pkgname)
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	make ndrop.1
}

package() {
	install -Dm644 $_pkgname/ndrop.1 "$pkgdir/usr/share/man/man1/ndrop.1"
	install -Dm755 $_pkgname/ndrop "$pkgdir/usr/bin/ndrop"
}
sha256sums=('SKIP')
