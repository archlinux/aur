#!/bin/sh
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>

pkgname=purple-whatsapp-git
pkgver=0.8.2
pkgrel=1
pkgdesc="WhatsApp protocol implementation for libpurple (pidgin)"
arch=('i686' 'x86_64')
url="https://github.com/davidgfnet/whatsapp-purple"
license=('GPLv2')
depends=('libpurple' 'freeimage')
optdepends=('pidgin')
provides=('purple-whatsapp')
source=('git+https://github.com/davidgfnet/whatsapp-purple.git')
sha512sums=('SKIP')

pkgver() {
  cd "$SRCDEST/whatsapp-purple"
  git describe --always | sed 's|-|.|g' | cut -d "v" -f2
}

build() {
  cd "$srcdir/whatsapp-purple"
  make
}

package() {
  cd "$srcdir/whatsapp-purple"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
