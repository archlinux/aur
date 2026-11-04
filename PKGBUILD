# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="xsnow"
pkgver=3.9.10
pkgrel=1
pkgdesc="Let it snow on your desktop"
url="https://www.ratrabbit.nl/ratrabbit/xsnow/"
license=("GPL3")
arch=("x86_64" "i386" "armv7h" "aarch64")
conflicts=("xsnow-bin" "xsnow-legacy" "xsnow-comp-patch-git")
depends=("atk" "cairo" "gtk3" "gsl" "libx11" "libxpm" "libxml2")
source=("https://www.ratrabbit.nl/downloads/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('a9d959af795177494d7dbcaf3e67db02b6b5583bb06864e9d54efb58b902a9cf2fb17f72594c0789a048911ed7a226f460611adb4c81afe69b8d9bcf2ce5d68b')

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


