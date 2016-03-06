# Contributor: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'

pkgname=wolf3d-shareware
pkgver=1.4
pkgrel=3
pkgdesc='Classic first person shooter, shareware episode data'
arch=(any)
url="https://3drealms.com/catalog/wolfenstein-3d_25/"
license=('custom')
source=('ftp://ftp.gamers.org/pub/games/wolf3d/official/1wolf14.zip')
md5sums=('a29432cd4a5184d552d8e5da8f80a531')
makedepends=('dynamite-git')

build() {
  cd $srcdir/
  mkdir wolf3d
  mv W3DSW14.SHR wolf3d
  cd wolf3d
  id-shr-extract W3DSW14.SHR
  rm W3DSW14.SHR
}
package() {
  install -d -m755 $pkgdir/usr/share/
  install -d -m755 $pkgdir/usr/share/wolf3d
  cp -R wolf3d $pkgdir/usr/share/
  install -d -m755 $pkgdir/usr/share/licenses/$pkgname
  install -m644 wolf3d/vendor.doc "$pkgdir"/usr/share/licenses/wolf3d-shareware/
  cd $pkgdir/usr/share/wolf3d
  touch -d 930101 *
}

