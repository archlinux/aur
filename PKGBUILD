# Maintainer: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>
# Contributor: Valère Monseur <valere DOT monseur AT ymail·com>

pkgname=eid-viewer
pkgver=4.0.7_195
_pkgver=tcm227-258907
pkgrel=2

pkgdesc="Viewer for Belgian Electronic Identity Card"
arch=('i686' 'x86_64')
url="http://eid.belgium.be/"
license=('LGPL3')

depends=('java-runtime' 'gsettings-desktop-schemas' 'eid-mw')
source=("http://eid.belgium.be/nl/binaries/eid-viewer-${pkgver//_/-}.src.tar_$_pkgver.gz")
sha256sums=('e263e6751ef7c185e278a607fdc46c207306d9a56c6ddb2ce6f58fb4464a2893')
install=eid-viewer.install

build() {
  cd "$srcdir/$pkgname-${pkgver%_*}"
  ./configure --prefix=/usr
}

package() {
  cd "$srcdir/$pkgname-${pkgver%_*}"
  make install DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
