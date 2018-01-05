# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=gnonlin
pkgver=1.4.0
pkgrel=1
pkgdesc='Library for creating non-linear video editors'
arch=('x86_64')
url='http://gnonlin.sourceforge.net/'
depends=('gstreamer')
makedepends=('python' 'gst-plugins-base' 'pkgconfig')
license=('LGPL')
source=("https://gstreamer.freedesktop.org/src/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('2d667e1632816ea8a6ff7c8b75b29241b6542e1f6ab41d9d51661c287006667f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
