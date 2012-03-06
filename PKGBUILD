# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=clutter
pkgver=1.9.14
pkgrel=1
pkgdesc="A GObject based library for creating fast, visually rich graphical user interfaces"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('cogl' 'mesa' 'json-glib' 'atk' 'libxi')
makedepends=('gobject-introspection' 'mesa')
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('4a4a4ca92eaf6875318cbdf5b2f173bdcd7adafd94add4cd815770abed02e70c')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-introspection
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
