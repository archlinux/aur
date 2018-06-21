# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Motohiro Ueki <ueki.com@gmail.com>
# Contributor: nkoizu <nkoizu@gmail.com>

pkgname=gauche
pkgver=0.9.5
pkgrel=4
url='https://practical-scheme.net/gauche/'
pkgdesc='R5RS Scheme implementation (provides gosh)'
depends=('libatomic_ops' 'slib')
license=('BSD')
arch=('x86_64')
install=$pkgname.install
source=("https://downloads.sourceforge.net/$pkgname/Gauche-$pkgver.tgz")
sha256sums=('4c8a53213de112708bbda5fa9648c21497d43ebf809ed5b32b15f21266b4e73c')

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
