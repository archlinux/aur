# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=retty
pkgver=1.0
pkgrel=3
pkgdesc="Tiny tool, that lets you attach processes running on other terminals."
arch=('i686')
url="http://pasky.or.cz/~pasky/dev/retty"
license=('GPL')
makedepends=('perl')
source=(http://pasky.or.cz/~pasky/dev/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('f49667d8115b7c5a907058c9623fc465')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -D -m755 $pkgname "${pkgdir}/usr/bin/$pkgname"
  install -D -m755 blindtty "${pkgdir}/usr/bin/blindtty"
  install -D -m644 $pkgname.1 "${pkgdir}/usr/share/man/man1/$pkgname.1"
}
