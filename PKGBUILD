# Maintainer: Tomasz Morawski (Kerrex) <romen3@linux.pl>

pkgname=zezenia
pkgver=570
pkgrel=3
pkgdesc="Zezenia Online is an actively developed free-to-play 2D MMORPG."
arch=('i686' 'x86_64')
url=http://zezeniaonline.com/
license=(custom)
makedepend=('unzip')
install=$pkgname.install
provides=($pkgname)
noextract=("$pkgname"_"$pkgver"_linux.zip)
source=(https://s3-eu-west-1.amazonaws.com/zezeniamedia/client/"$pkgname"_"$pkgver"_linux.zip)
md5sums=(dc7533a9520ada57b37ba0f9ab5a3404)

build()
{
  cd $srcdir
  unzip "$pkgname"_"$pkgver"_linux.zip
}
package()
{
  mkdir -p $pkgdir/opt/Zezenia
  rm "$pkgname"_"$pkgver"_linux.zip
  cp -R $srcdir/* $pkgdir/opt/Zezenia/
  chown -R :games $pkgdir/opt/Zezenia
  chmod -R 774 $pkgdir/opt/Zezenia
}
