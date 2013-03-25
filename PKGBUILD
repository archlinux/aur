# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=clutter
pkgver=1.14.0
pkgrel=1
pkgdesc="A GObject based library for creating fast, visually rich graphical user interfaces"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('cogl' 'mesa' 'json-glib' 'atk' 'libxi')
makedepends=('gobject-introspection')
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('3b7a07373c27fad4f0cf59fd66a6855d66f9a42b7b570a00ca51a8b488af64d5')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-introspection
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
