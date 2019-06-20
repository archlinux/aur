# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Motohiro Ueki <ueki.com@gmail.com>
# Contributor: nkoizu <nkoizu@gmail.com>

pkgname=gauche
pkgver=0.9.8
pkgrel=1
url='https://practical-scheme.net/gauche/'
pkgdesc='R7RS Scheme implementation (includes gosh)'
depends=(libatomic_ops slib)
license=(BSD)
arch=(x86_64)
source=("https://downloads.sourceforge.net/$pkgname/Gauche-$pkgver.tgz")
sha256sums=('3eb30d1051d8b48999fe46511c9f6983057735312c9832b7db13f9db140db74b')

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
