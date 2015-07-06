# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>

pkgname=purple-whatsapp
pkgver=0.8.4
pkgrel=1
pkgdesc="WhatsApp protocol implementation for libpurple (pidgin)"
arch=('i686' 'x86_64')
url="https://github.com/davidgfnet/whatsapp-purple"
license=('GPLv2')
depends=('libpurple' 'freeimage')
optdepends=('pidgin')
provides=('purple-whatsapp')
source=("git+https://github.com/davidgfnet/whatsapp-purple.git#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
  cd "$srcdir/whatsapp-purple"
  make
}

package() {
  cd "$srcdir/whatsapp-purple"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
