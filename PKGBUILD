# Contributor: Biginoz < biginoz AT free point fr >
# Contributor: ggranga
# Maintainer: Jose Riha < jose 1711 gmail com >

pkgname=mobac
pkgver=2.3.3
pkgrel=1
pkgdesc="Mobile Atlas Creator (formerly TrekBuddy Atlas Creator) creates offline atlases for GPS handhelds and cell phone applications like TrekBuddy, AndNav and other"
arch=('x86_64')
url="http://mobac.sourceforge.net/"
license=('GPL')
depends=('java-runtime')
source=("https://downloads.sourceforge.net/project/mobac/Mobile%20Atlas%20Creator/MOBAC%202.0/Mobile%20Atlas%20Creator%20${pkgver}.zip"
	"mobac.sh"
	"directories.ini"
	"mobac.desktop"
	"mobac.png")

md5sums=('2b8ddd6e7bcff264f0152db7ea08ef06'
         '1bc898bc6a623b5550249f96da0f0a29'
         '1552ae46115fd8315658ed660b16cf03'
         'a5710ec7830b78216f516e7955b57c55'
         'b1dc3b3e5f08216e0b32d31d60809cee')

build ()
{
  rm "Mobile Atlas Creator.exe"
}

package() {
  cd "$srcdir/"
  mkdir -p $pkgdir/usr/bin
  install -Dm755 $srcdir/mobac.sh $pkgdir/usr/bin/mobac

  mkdir -p $pkgdir/usr/share/applications
  install -Dm755 $srcdir/mobac.desktop $pkgdir/usr/share/applications/mobac.desktop

  mkdir -p $pkgdir/usr/share/mobac/mapsources
  install -Dm644 $srcdir/mapsources/* $pkgdir/usr/share/mobac/mapsources/
  install -Dm644 $srcdir/directories.ini $pkgdir/usr/share/mobac/
  install -Dm644 $srcdir/Mobile_Atlas_Creator.jar $pkgdir/usr/share/mobac/
  install -Dm644 $srcdir/README.html $pkgdir/usr/share/mobac/README.HTM
  install -Dm644 $srcdir/ReleaseNotes.txt $pkgdir/usr/share/mobac/
  install -Dm644 $srcdir/CHANGELOG.txt $pkgdir/usr/share/mobac/
  install -Dm644 $srcdir/mobac.png $pkgdir/usr/share/pixmaps/mobac.png
}
