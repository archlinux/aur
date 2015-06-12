# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=blueshift-tray
pkgver=1.2
pkgrel=1
pkgdesc="Systray wrapper for Blueshift"
arch=(any)
url="https://github.com/maandree/blueshift-tray"
license=('GPL3')
depends=(python2 pygtk 'blueshift>=1.4')
makedepends=(make coreutils sed auto-auto-complete)
install=blueshift-tray.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=('521d6f7da630dc6e2b8ebd44a98760e3bc7413c7f2cc6905b182aede6c7f9fb7')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

