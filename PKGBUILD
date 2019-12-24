# $Id: PKGBUILD 159666 2016-01-31 05:48:37Z bgyorgy $
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Contributor: Adam <adam@russ.co.il>

pkgname=gnome-web-photo
pkgver=0.10.6
pkgrel=3
pkgdesc="Generate full-size image files and thumbnails from HTML files and web pages"
arch=('i686' 'x86_64')
url="https://gitlab.gnome.org/Archive/gnome-web-photo"
license=('LGPL')
depends=('webkitgtk')
makedepends=('intltool')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('1353fc1abe9fcd38b3e09c6282e43aeb0c306201a4df9e25d4834407ba2cbe7f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
