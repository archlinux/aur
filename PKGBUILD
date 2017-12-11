# Maintainer: robertfoster
# Contributor: said
# Contributor: Ner0
# Contributor: farnsworth517 

pkgname=soulseekqt
pkgver=20171121
_pkgver=2017-11-21
pkgrel=4
pkgdesc="A desktop client for the Soulseek peer-to-peer file sharing network"
arch=('x86_64')
url="http://www.soulseekqt.net/news/"
license=('CUSTOM')
depends=('fontconfig' 'libxext' 'libxrender' 'qt5-multimedia')
makedepends=('libselinux')
source=("https://www.dropbox.com/s/ru2mvycljfrejcx/SoulseekQt-$_pkgver-64bit.AppImage"
	$pkgname.desktop
        $pkgname.png
)

package () {
  cd $srcdir

   ./SoulseekQt-${_pkgver}-64bit  --appimage-extract

  cd squashfs-root

  install -vDm755 SoulseekQt "$pkgdir/usr/bin/$pkgname"
  install -vDm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -vDm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/soulseek.png"
}

md5sums=('19af4fe0f7fbd382e3e68eb92f32c52b'
         '810a4200a3c8568257b66b6bdea5c29c'
         '958e9c06bd684e812b6d27515b88b97c')
