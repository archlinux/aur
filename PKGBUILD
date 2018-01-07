# $Id: PKGBUILD 310007 2017-11-15 14:11:34Z foutrelis $
# Maintainer : Ionut Biru <ibiru@archlinux.org>

pkgname=telepathy-rakia
pkgver=0.8.0
pkgrel=1
pkgdesc="SIP connection manager for Telepathy"
arch=('x86_64')
url="http://telepathy.freedesktop.org"
license=('LGPL')
depends=('telepathy-glib' 'sofia-sip')
makedepends=('libxslt' 'python2')
install=telepathy-rakia.install
groups=('telepathy')
replaces=('telepathy-sofiasip')
source=(http://telepathy.freedesktop.org/releases/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('09038d4625fcf81e9d3228ebf18bc378')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --libexecdir=/usr/lib/telepathy
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
