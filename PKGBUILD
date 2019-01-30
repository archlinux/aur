# Maintainer:  Kr1ss <kr1ss.x@yandex.com>
# Contributor: Edgar Fournival <contact at edgar-fournival dot fr>

pkgname=hget-git
_pkgname=hget
_vendor="github.com/huydx"
pkgver=r32.8cff5f7
pkgrel=1
pkgdesc="Rocket fast, interruptable, resumable download accelerator written in Golang"
arch=('x86_64' 'i686')
url="https://$_vendor/$_pkgname"
license=('MIT')
makedepends=('git' 'go')
provides=('hget')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	make install
}

package() {
	install -Dm755 "$_pkgname/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$_pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
