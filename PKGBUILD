# Maintainer: Arno Onken <asnelt@asnelt.org>
pkgname=rrep
pkgver=1.4.1
pkgrel=1
pkgdesc='Replaces strings with regular expressions in files and directories'
arch=('x86_64')
url='https://sr.ht/~asnelt/rrep/'
license=('GPL-3.0-or-later')
depends=('acl' 'attr')
makedepends=('gettext')
source=("https://git.sr.ht/~asnelt/rrep/refs/download/upstream/$pkgver/$pkgname-$pkgver.tar.gz"
        "https://git.sr.ht/~asnelt/rrep/refs/download/upstream/$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('1a816ebcdb0c51c1cdfc5fc7101b330a214e6492440fe1937ea44078dbee50ff'
            'SKIP')
validpgpkeys=('528E36DD2348C90F8B7FF085A441BB1D665FE6A8') # Arno Onken <asnelt@asnelt.org>

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
