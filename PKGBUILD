# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: AlphaJack <alphajack at tuta dot io>

pkgname=xsnow
pkgver=3.4.2
pkgrel=2
pkgdesc="Let it snow on your desktop"
url="https://sourceforge.net/projects/xsnow/"
license=("GPL3")
arch=(x86_64 i686)
conflicts=(xsnow-bin)
depends=(gtk3 libxpm)
source=("https://nav.dl.sourceforge.net/project/xsnow/xsnow-$pkgver.tar.gz")
sha256sums=('c618d7a73cef7070755f38ddc3665487afa8c71a9c82ae9055723e594a62fd9e')

build(){
 cd $pkgname-$pkgver
 ./configure
 make
}

package(){
 cd $pkgname-$pkgver
 install -D -m 755 "src/xsnow" "$pkgdir/usr/bin/xsnow"
 install -D -m 644 "data/xsnow.appdata.xml" "$pkgdir/usr/share/metainfo/xsnow.appdata.xml"
 install -D -m 644 "data/xsnow.desktop" "$pkgdir/usr/share/applications/xsnow.desktop"
 install -D -m 644 "src/Pixmaps/xsnow.svg" "$pkgdir/usr/share/pixmaps/xsnow.svg"
 install -d "$pkgdir/usr/share/man/man6"
 gzip -c "src/xsnow.6" > "$pkgdir/usr/share/man/man6/xsnow.6.gz"
}


