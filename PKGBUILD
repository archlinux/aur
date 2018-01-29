#Maintainer: Steffen Weber <-boenki-gmx-de->
#Contributor: Ionut Biru <ionut@archlinux.ro>

pkgname=leet-generator
pkgver=0.2
pkgrel=3
pkgdesc="Converts plaintext into 133773}{7"
arch=('x86_64')
url="https://sourceforge.net/projects/$pkgname"
license=('GPL2')
depends=('gtk2')
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2
        $pkgname.desktop)
md5sums=('347389fb55a395fa0b60d3625d73b5b1'
         '6a2aba42609dae5f4267e90d404269a3')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
