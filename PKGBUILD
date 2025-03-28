#!/bin/sh
# Maintainer: hairlinehd
pkgname='obgk'
_pkgname='obgk'
pkgver=latest
pkgrel=1
pkgdesc="osu!stable video and background deleter"
arch=('x86_64')
url="https://github.com/hairlinehd/obgk"
license=('Unlicense')
depends=('bash' 'fd' 'findutils' 'wget')
makedepends=('git')
optdepends=('zenity: nice gui to select your songs folder')
source=('git+https://github.com/hairlinehd/obgk.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$pkgname"
	# idk a better way to ignore build()
	echo "installing"
} 

package () {
	cd "$pkgname"
	install -Dm755 ./obgk "$pkgdir/usr/bin/obgk"
}
