# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=ttf-x2
pkgver=1.0
pkgrel=0
pkgdesc="X Series 2 fonts are built on freely available fonts and extended to support Persian, Arabic, Urdu, Pashto, Dari, Uzbek, Kurdish, Uighur, old Turkish (Ottoman) and modern Turkish (Roman)."
arch=('any')
url="http://wiki.irmug.com/index.php?title=X_Series_2"
license=('custom:OFL')
groups=(persian-fonts)
depends=('fontconfig' 'xorg-font-utils' 'unzip')
source=("zar.zip::http://dl.irmug.com/dl.php?id=21"
 	"niloofar.zip::http://dl.irmug.com/dl.php?id=3" 
	"khoramshahr.zip::http://dl.irmug.com/dl.php?id=2" 
	"kayhan.zip::http://dl.irmug.com/dl.php?id=1" 
	"yaghut.zip::http://dl.irmug.com/dl.php?id=17" 
	"riyaz.zip::http://dl.irmug.com/dl.php?id=5" 
	"roya.zip::http://dl.irmug.com/dl.php?id=6" 
	"shafigh.zip::http://dl.irmug.com/dl.php?id=7" 
	"shafigh-kurd.zip::http://dl.irmug.com/dl.php?id=9" 
	"shafigh-uzbek.zip::http://dl.irmug.com/dl.php?id=8" 
	"shiraz.zip::http://dl.irmug.com/dl.php?id=10" 
	"sols.zip::http://dl.irmug.com/dl.php?id=11" 
	"tabriz.zip::http://dl.irmug.com/dl.php?id=12" 
	"titre.zip::http://dl.irmug.com/dl.php?id=13" 
	"traffic.zip::http://dl.irmug.com/dl.php?id=14" 
	"paatch.zip::http://dl.irmug.com/dl.php?id=4" 
	"vahid.zip::http://dl.irmug.com/dl.php?id=15" 
	"vosta.zip::http://dl.irmug.com/dl.php?id=16" 
	"yekan.zip::http://dl.irmug.com/dl.php?id=19" 
	"yermook.zip::http://dl.irmug.com/dl.php?id=20" 
	"yas.zip::http://dl.irmug.com/dl.php?id=18" 
	"ziba.zip::http://dl.irmug.com/dl.php?id=22")
noextract=("${source[@]%%::*}")
install=$pkgname.install
md5sums=('8e08f1d30a07e687d0a858558a852ce1'
         '443e92a9b431497a28b6d9e7d1384c40'
         '4a91b8b194a156fd4023b4debd567c63'
         'c432b18c9fe7f69c5d07a19c2022cce8'
         '7d5524e06e12553cc11e840bb13cc0c6'
         '6e5bb6523f718c4b714d3c21b2f28d6e'
         '7cfc3b472fe2bd493791f332ccabd387'
         '75d4c47f48ff3e35c8c602e2d8700e08'
         '221061d0eb93bc05ca18f45f5f7667c2'
         '90cbb8e150a83eab7fd74f784e8d203e'
         '255383be1f0a0fafe171c7f60fc2ca48'
         '1e74c51fabf865444c38bfa9976c9390'
         '8dac005c7e360f5f086d20c67bd35c35'
         '5a044355abe553785f5d215cec157eb4'
         '474d4ded68d37332a4c97ae9d929af53'
         '9ec31680d5e9a44a2b4237d78b4722ad'
         '1455e778dd31ce54c4c040b839faed37'
         '49841f03bbdeed85be15499e258147a9'
         '83a4d9e86174a28f7e27b16523eb38fc'
         '078da267d9c01d3651e235f0be966c8f'
         'b4ba9c744edec0245d911fdd1a4e20e9'
         'e5642b4ec4b144b2debeaebee4eff6ae')

prepare() {
  unzip -o -qq -LL -j '*.zip' -d $srcdir/$pkgname/ 
}

package() {
  chmod 644 "$srcdir/$pkgname/"*.*
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  cp -dpr --no-preserve=ownership "$srcdir/$pkgname/"*.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -D "$srcdir/$pkgname/ofl.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
