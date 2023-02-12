# Maintainer: ECHO <exhq@waifu.club>
# Contributor: nea <nea@nea.moe>

pkgbase=neowofetch-git
pkgname=$pkgbase
license=('GPL3')
pkgdesc="a combination of neofetch and uwufetch written in go"
pkgver=r37.55c749c
pkgrel=1
url="https://git.exhq.dev/neowofetch"
depends=(wmctrl)
makedepends=(go git)
arch=('x86_64')
source=("git+https://github.com/exhq/neOwOfetch.git")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/neOwOfetch
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/neOwOfetch
	go build .
}

package() {
	install -Dm755 $srcdir/neOwOfetch/neowofetch $pkgdir/usr/bin/neowofetch
}
