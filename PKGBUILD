# Maintainer: Simon Gomizelj <simongmzlj@gmail.com>

pkgname=repose
pkgver=5
pkgrel=1
pkgdesc="archlinux repo building tool"
arch=('i686' 'x86_64')
url="http://github.com/vodik/repose"
license=('GPL')
depends=('pacman' 'libarchive' 'gnupg')
makedepends=('git')
source=("$url/archive/$pkgver.tar.gz")
sha1sums=('cd5ab13aae67079245697aec5eaab8b7566c63cb')

build() {
  make -C "$pkgname-$pkgver"
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}

# vim: ft=sh syn=sh et
