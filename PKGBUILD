# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="xsnow"
pkgver=3.9.0
pkgrel=1
pkgdesc="Let it snow on your desktop"
url="https://www.ratrabbit.nl/ratrabbit/xsnow/"
license=("GPL3")
arch=("x86_64" "i386" "armv7h" "aarch64")
conflicts=("xsnow-bin" "xsnow-legacy" "xsnow-comp-patch-git")
depends=("atk" "cairo" "gtk3" "gsl" "libx11" "libxpm" "libxml2")
source=("https://www.ratrabbit.nl/downloads/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('15bea3ac436631e9914db7941cc2f475dd2353fb20b4d4d736182edeeeef8ae605431ad9d9b9bd876e88a33186355ea51dd718dba8b1097681d2df3a379a2817')

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


