# Maintainer: Nikhil Singh <nik.singh710@gmail.com>
pkgname=archwiki-offline
pkgver=r13.87114e1
pkgrel=1
pkgdesc="A simple script to view ArchWiki offline"
arch=("any")
url="https://github.com/niksingh710/archwiki-offline"
license=('MIT')
makedepends=("git")
depends=(
'arch-wiki-docs'
)
optdepends=(
'fzf: for listing in fzf'
'rofi: for listing in rofi'
'dmenu: for listing in dmenu'
'w3m: for viewing in cli with wm3'
)
source=("git+https://github.com/niksingh710/archwiki-offline.git")
md5sums=('SKIP')
provides=('archwiki-offline')
conflicts=('archwiki-offline')

pkgver() {
	cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm755 ./archwiki-offline "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ./Readme.md "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

# vim: ft=PKGBUILD
