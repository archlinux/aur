# Contributor: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'

pkgname=wolf3d-shareware
pkgver=1.4
pkgrel=4
pkgdesc='Classic first person shooter, shareware episode data'
arch=(any)
url="https://3drealms.com/catalog/wolfenstein-3d_25/"
license=('custom')
source=('ftp://ftp.gamers.org/pub/games/wolf3d/official/1wolf14.zip')
noextract=('1wolf14.zip')
md5sums=('e6d75d885e408003d2f4751d8dfd1cb0')
makedepends=('p7zip' 'unzip')

build() {
  cd $srcdir/
  unzip 1wolf14.zip
  mkdir wolf3d
  cat WOLF3D1.1 WOLF3D1.2 WOLF3D1.3 > wolf3d/WOLF3D1
  cd wolf3d
  7z x WOLF3D1
  rm WOLF3D1
}
package() {
  install -d -m755 $pkgdir/usr/share/
  install -d -m755 $pkgdir/usr/share/wolf3d
  cp -R wolf3d $pkgdir/usr/share/
  install -d -m755 $pkgdir/usr/share/licenses/$pkgname
  install -m644 wolf3d/READ1ST.TXT "$pkgdir"/usr/share/licenses/wolf3d-shareware/
  cd $pkgdir/usr/share/wolf3d
  touch -d 930101 *
}

