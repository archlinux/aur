# Maintainer: tailinchu <use_my_id at gmail dot com>
# Co-Maintainer: basica <aur basica at gmail dot com>

pkgname=ttf-noto
pkgver=20160917
pkgrel=1
pkgdesc="Fonts support all languages/characters in Unicode"
arch=('any')
url="http://www.google.com/get/noto"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
provides=('ttf-font')
source=("https://noto-website-2.storage.googleapis.com/pkgs/Noto-hinted.zip")
install=$pkgname.install
PKGEXT='.pkg.tar' # because XZ compression is awfully slow
md5sums=('5489f1765afd34a2adfdc04d014762e7')

package() 
{	
	install -dm 755 $pkgdir/usr/share/fonts/{TTF,OTF}
	install -D -m644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
	install -D -m644 $srcdir/*.otf $pkgdir/usr/share/fonts/OTF	
    install -D -m644 $srcdir/LICENSE_OFL.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE_OFL.txt
}
