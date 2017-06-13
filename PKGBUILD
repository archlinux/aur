# Maintainer: Diego Vialle de Angelo <dideangelo at gmail dot com>
pkgname=brother-dcp8157dn
pkgver=3.0.0
pkgrel=1
pkgdesc="Brother CUPS and LPD driver for DCP-8157DN"
arch=("x86_64")
url="http://solutions.brother.com/linux/en_us/index.html"
license=("unknown")
depends=("cups" "lib32-glibc")
install="main.install"

source=("http://download.brother.com/welcome/dlf005563/dcp8157dnlpr-$pkgver-$pkgrel.i386.deb"
        "http://download.brother.com/welcome/dlf005565/dcp8157dncupswrapper-$pkgver-$pkgrel.i386.deb")
md5sums=("57efee890748b0528712c19470d0d86f"
		 "fb16c07235cebbf855c91b2fe212fc20")

build() {
  for i in $srcdir/*.deb; do
    ar -x $i
    bsdtar xf data.tar.gz
  done
}

package() {
	cp -r "$srcdir/etc" "$pkgdir"
	cp -r "$srcdir/opt" "$pkgdir"
	cp -r "$srcdir/var" "$pkgdir"
}
