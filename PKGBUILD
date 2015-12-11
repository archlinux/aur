# Maintainer: lily wilson <hotaru@thinkindifferent.net>
pkgname=ralcgm
pkgver=3.50
pkgrel=1
pkgdesc="a program to interpret Computer Graphics Metafiles."
arch=('i686' 'x86_64')
url="http://www.agocg.ac.uk/train/cgm/ralcgm.htm"
license=('license')
source_i686=("http://ftp.heanet.ie/disk1/pld-linux/pool/r/$pkgname/$pkgname-$pkgver-3.i686.rpm")
source_x86_64=("http://ftp.heanet.ie/disk1/pld-linux/pool/r/$pkgname/$pkgname-$pkgver-3.amd64.rpm")
md5sums_i686=('0177c09e07c8553107e1883313893f34')
md5sums_x86_64=('2fe69cbcdef0a2436a7db67beece881c')

package() {
  cd $srcdir
  install -Dm755 ./usr/bin/ralcgm $pkgdir/usr/bin/ralcgm
  cp -r ./usr/share $pkgdir/usr/share
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  zcat ./usr/share/doc/ralcgm-3.50/README.gz|tail -n 30|head -n -2>$pkgdir/usr/share/licenses/$pkgname/LICENSE
}
