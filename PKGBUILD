# Maintainer: Simon Gomizelj <simongmzlj@gmail.com>

pkgname=repose
pkgver=6
pkgrel=1
pkgdesc="archlinux repo building tool"
arch=('i686' 'x86_64')
url="http://github.com/vodik/repose"
license=('GPL')
depends=('pacman' 'libarchive' 'gnupg')
makedepends=('git')
source=("$url/archive/$pkgver.tar.gz")
sha1sums=('c5a7f8f737d853bac15e7a2d7312114954525622')

build() {
  make -C "$pkgname-$pkgver"
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}

# vim: ft=sh syn=sh et
