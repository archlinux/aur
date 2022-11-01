# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="xsnow"
pkgver=3.5.3
pkgrel=2
pkgdesc="Let it snow on your desktop"
url="https://sourceforge.net/projects/xsnow/"
license=("GPL3")
arch=("x86_64" "i386" "armv7h" "aarch64")
conflicts=("xsnow-bin" "xsnow-legacy" "xsnow-comp-patch-git")
depends=("atk" "cairo" "gtk3" "gsl" "libx11" "libxpm" "libxml2")
source=("https://nav.dl.sourceforge.net/project/xsnow/xsnow-$pkgver.tar.gz")
sha256sums=('c3f482ae98b4685d25cafad935fddb42b01ade725c7a416b737861bae71deec1')

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


