# Original Author: Johannes Wienke <languitar at semipol dot de>
# Maintainer: Danilo Bargen <aur at dbrgn dot ch>

pkgname=geotag
pkgver=0.101
pkgrel=1
pkgdesc="Geotag is an open source program that allows you match date/time information from photos with location information from a GPS unit or from a map"
arch=('i686' 'x86_64')
url="http://geotag.sourceforge.net/"
license=('GPL2')
depends=('java-runtime' 'perl-exiftool')
source=("http://downloads.sourceforge.net/project/geotag/geotag/$pkgver/geotag-$pkgver.jar"
        "$pkgname.desktop"
        "$pkgname.sh")
noextract=("geotag-$pkgver.jar")
sha256sums=('68101cc0dfffa518336a62ad417c7de5bfdd33da895b05a4f6f97415a4860686'
            '03e25f98f958a205fed56657e21c30f636b8f67bc0f5e41f88d6bf3bfa1fb3fe'
            'dd836097b81d0d4fea801ef4211d2e60befe6067e8ae3d29263bebcf268590bd')


package() {
  cd $srcdir

  # Unpack icon from JAR file
  bsdtar -xf geotag-${pkgver}.jar images/geotag-128.png

  # Install JAR file
  install -D -m644 $pkgname-$pkgver.jar $pkgdir/usr/share/java/$pkgname/$pkgname.jar

  # Install desktop file
  install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D -m755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
  install -D -m644 $srcdir/images/$pkgname-128.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
