# Maintainer: Nick Østergaard <oe.nick at gmail dot com>
pkgname=liblxi
pkgver=1.22
pkgrel=1
pkgdesc="LXI library"
arch=('i686' 'x86_64')
url="https://github.com/lxi/liblxi"
license=('BSD-3')
provides=('liblxi')
conflicts=('liblxi-git')
depends=('libxml2' 'avahi' 'libadwaita')
makedepends=('meson')
optdepends=('lxi-tools')
source=("https://github.com/lxi/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('14d46cc60f38998bccb6d6cda020048340bb9e0bc0afabbd77ff89b6bb05ccdb')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  meson --prefix=/usr --buildtype=plain --wrap-mode=nofallback . build
  meson compile -C build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  meson install -C build --destdir "$pkgdir"
}

# vim:set ts=2 sw=2 et:

