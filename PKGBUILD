# Maintainer: tailinchu <use_my_id at gmail dot com>

pkgname=ttf-noto
pkgver=20150612
pkgrel=1
pkgdesc="Fonts support all languages/characters in Unicode"
arch=('any')
url="http://www.google.com/get/noto"
license=('apache')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=()
conflicts=()
provides=('ttf-font')
source=("http://storage.googleapis.com/noto-website/pkgs/Noto-hinted.zip")
install=$pkgname.install
PKGEXT='.pkg.tar' # because XZ compression is awfully slow
md5sums=('077a9978839e37b29af710819fb17729')

package() {
	mkdir -p $pkgdir/usr/share/fonts/{TTF,OTF}
	cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
	cp $srcdir/*.otf $pkgdir/usr/share/fonts/OTF
	chmod 644 $pkgdir/usr/share/fonts/{TTF,OTF}/*
}
