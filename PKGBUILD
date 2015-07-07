# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=dunelegacy
pkgver=0.96.3
pkgrel=2
pkgdesc="Updated clone of Westood Studios' Dune2"
arch=('i686' 'x86_64')
url="http://dunelegacy.sourceforge.net"
license=('GPL')
depends=('sdl_mixer' 'desktop-file-utils')
changelog=dunelegacy.changelog
install=dunelegacy.install
source=(http://downloads.sourceforge.net/sourceforge/dunelegacy/$pkgname-$pkgver-src.tar.bz2)
md5sums=('1ca64c06646aeb537d47f601a49463e9')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=$pkgdir/usr install

  # install icon and desktop files
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
