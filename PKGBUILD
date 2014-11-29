# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=mudix
pkgver=4.3
pkgrel=2
pkgdesc="A lightweight and very stable MUD client for the linux console"
arch=('i686' 'x86_64')
url="http://dw.nl.eu.org/mudix.html"
license=('GPL')
depends=('ncurses')
source=(ftp://ftp.uni-kl.de/pub/linux/gentoo/distfiles/$pkgname-$pkgver.tar.gz)
md5sums=('8a360b6fd1207c5aa4d8775c16a38705')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -Dm755 "${srcdir}"/$pkgname-$pkgver/mudix "${pkgdir}"/usr/bin/mudix
  install -Dm644 "${srcdir}"/$pkgname-$pkgver/sample.usr "${pkgdir}"/usr/share/mudix/mudix.sample
}
