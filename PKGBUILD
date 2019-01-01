# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Motohiro Ueki <ueki.com@gmail.com>
# Contributor: nkoizu <nkoizu@gmail.com>

pkgname=gauche
pkgver=0.9.7
pkgrel=1
url='https://practical-scheme.net/gauche/'
pkgdesc='R7RS Scheme implementation (includes gosh)'
depends=(libatomic_ops slib)
license=(BSD)
arch=(x86_64)
source=("https://downloads.sourceforge.net/$pkgname/Gauche-$pkgver.tgz")
sha256sums=('2d33bd942e3fc2f2dcc8e5217c9130c885a0fd1cb11a1856e619a83a23f336a0')

build() {
  cd "Gauche-$pkgver"

  ./configure --enable-multibyte=utf-8 --prefix=/usr
  make
}

package() {
  cd "Gauche-$pkgver"

  make DESTDIR="$pkgdir" install-pkg install-doc
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# getver: practical-scheme.net/gauche/gmemo/index.cgi?ReleaseNotes
# vim: ts=2 sw=2 et:
