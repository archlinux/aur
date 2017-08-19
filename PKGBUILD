# Maintainer: M0Rf30
# Contributor: said
# Contributor: Ner0
# Contributor: farnsworth517 

pkgname=soulseekqt
pkgver=20170729
_pkgver=2017-7-29
pkgrel=1
pkgdesc="A desktop client for the Soulseek peer-to-peer file sharing network"
arch=('i686' 'x86_64')
url="http://www.soulseekqt.net/news/"
license=('CUSTOM')
depends=('double-conversion' 'fontconfig' 'libxext' 'libxrender' 'qt5-multimedia')
source=($pkgname.desktop 
        $pkgname.png )

source_i686=("https://www.dropbox.com/s/vh5bxoatgcj3csf/SoulseekQt-$_pkgver-32bit.tgz")
source_x86_64=("https://www.dropbox.com/s/vh5bxoatgcj3csf/SoulseekQt-$_pkgver-64bit.tgz")

package() {
  cd $srcdir
  ./SoulseekQt-2017-7-29-*.AppImage  --appimage-extract
  cd squashfs-root
  install -vDm755 SoulseekQt "$pkgdir/usr/bin/$pkgname"
  install -vDm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -vDm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/soulseek.png"
}

md5sums=('810a4200a3c8568257b66b6bdea5c29c'
         '958e9c06bd684e812b6d27515b88b97c')
md5sums_i686=('90e25ec8cc73132518547a45bdec5f59')
md5sums_x86_64=('90e25ec8cc73132518547a45bdec5f59')
