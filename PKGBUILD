# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: Angel Sartonev <a.sartonev at gmail dot com>

pkgname=otf-gfs-majuscule
pkgver=20181103
pkgrel=3
pkgdesc='Open Font Majuscule typefaces, provided by the Greek Font Society'
arch=(any)
url='http://www.greekfontsociety-gfs.gr/typefaces/majuscule'
license=('custom:SIL-OTF')
depends=()
source=("http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Ignacio.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Garaldus.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Jackson.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Nicefore.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Eustace.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Fleischman.zip"
	"http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_Ambrosia.zip"
	"LICENSE")

md5sums=('ec397b1199ca79404adec355eeb5c163'
         '7638996769c9162f0d8b8885c18af68f'
         '73d235051292e23bc807c71d8c951e6b'
         '02fcaf05448bb0df6696567975014132'
         'b54eea11af83c569b861a17800fb1945'
         'adcb048bdca18dd243c0337bdb0c5ecd'
         '891a6e880ca0ef06223eedfab7c0e035'
         '288069c8fb0c828b081833cfcfe0638b')

noextract=(${source[@]##*/})

package() {

cd "$srcdir"

unzip GFS_Ignacio.zip
unzip GFS_Garaldus.zip
unzip GFS_Jackson.zip
unzip GFS_Nicefore.zip
unzip GFS_Eustace.zip
unzip GFS_Fleischman.zip
unzip GFS_Ambrosia.zip

install -d $pkgdir/usr/share/fonts/$pkgname/
install -Dm644 $srcdir/GFS*/*otf $pkgdir/usr/share/fonts/$pkgname/
install -d $pkgdir/usr/share/licenses/$pkgname/
install -Dm644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
