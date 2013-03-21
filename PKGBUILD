# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=clutter
pkgver=1.13.10
pkgrel=1
pkgdesc="A GObject based library for creating fast, visually rich graphical user interfaces"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('cogl' 'mesa' 'json-glib' 'atk' 'libxi')
makedepends=('gobject-introspection')
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('64a5da9869af2ee76129e2abb3aa01cde38adbb73691d1aaa69ee98fb479d9c2')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-introspection
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
