# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>

# PKGBUILD forked from doas-sudo-shim [https://aur.archlinux.org/packages/doas-sudo-shim] by
# Maintainer: Jakub Jirutka <jakub@jirutka.cz>
pkgname=doas-sudo-shim-k
pkgver=0.1.2k
pkgrel=1
pkgdesc="Shim for the sudo command which utilizes doas (includes -k flag to ensure makepkg compatibility)"
arch=(any)
url="https://github.com/fclivaz42/doas-sudo-shim"
license=(ISC)
provides=(sudo)
conflicts=(sudo doas-sudo-shim)
depends=(awk doas sh)
makedepends=(asciidoctor)
source=("$pkgname-$pkgver.tar.gz::https://github.com/fclivaz42/doas-sudo-shim/archive/refs/tags/v0.1.2k.tar.gz")
sha256sums=('ed49ac624c4eb7080107e1cdc546cdce5be6994a9548f7f46ae0d35b3150ae51')

build() {
  cd $pkgname-$pkgver
  make man
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir" PREFIX=/usr
}
