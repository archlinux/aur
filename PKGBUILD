# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Motohiro Ueki <ueki.com@gmail.com>
# Contributor: nkoizu <nkoizu@gmail.com>

pkgname=gauche
pkgver=0.9.6
pkgrel=1
url='https://practical-scheme.net/gauche/'
pkgdesc='R7RS Scheme implementation (includes gosh)'
depends=('libatomic_ops' 'slib')
license=('BSD')
arch=('x86_64')
source=("https://downloads.sourceforge.net/$pkgname/Gauche-$pkgver.tgz")
sha256sums=('cd8928630d63b8043842a0526fbfb8f5f3c720b0d0ace81851e266ddfde69caf')

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
