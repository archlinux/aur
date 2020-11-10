# Maintainer:  Antonin Décimo <antonin at decimo dot gmail dot com>
pkgname=xkbprint
pkgver=1.0.5
pkgrel=1
pkgdesc="Print an XKB keyboard description "
arch=('x86_64')
url="https://www.x.org"
license=('X11')
depends=(libx11 libxkbfile xorgproto xorg-util-macros)
source=("$url/releases/individual/app/$pkgname-$pkgver.tar.gz"
        "$url/releases/individual/app/$pkgname-$pkgver.tar.gz.sig")
sha256sums=('af5d91b7e5b05f7d081b66e93fca0112cca049b7b6a644b2637b344d52054ac3'
            'SKIP')
validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A') # Matt Turner <mattst88@gmail.com>

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
