# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Helder Correia <helder.correia@netcabo.pt>
# Maintainer: SanskritFritz (gmail)

pkgname=toppler
pkgver=1.1.6
pkgrel=3
pkgdesc='A reimplementation of the classic jump & run game "Nebulus"'
arch=('i686' 'x86_64')
url="http://$pkgname.sourceforge.net/"
license=('GPL')
depends=('gcc-libs' 'sdl_mixer' 'zlib')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop")

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --localstatedir=/usr/share
  make

#  cd "$pkgdir"
#  chgrp root usr/bin/$pkgname
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
md5sums=('9df66bf36eea79553019baf768b36cdd'
         '95f97271fe1f629c396d20bb4d21b924')
