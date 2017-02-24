# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=abireport
pkgver=1.0.5
pkgrel=1
pkgdesc="Tool to create ABI reports from ELF binaries in packaging"
arch=('i686' 'x86_64')
url="https://github.com/clearlinux/abireport"
license=('Apache')
depends=('go')
source=("https://github.com/clearlinux/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a0b6fa0a5b160e3a40937e7e636729aaf55a033986f8c3abe59742d83216e162')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}


# vim:set ts=8 sts=2 sw=2 et:
