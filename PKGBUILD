# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
pkgname=tonemapping
pkgver=20110614
pkgrel=1
pkgdesc="a tonemapper for LDR images"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://zynaddsubfx.sourceforge.net/other/tonemapping"
license=('GPL3')
depends=('freeimage' 'fltk')
source=("http://zynaddsubfx.sourceforge.net/other/tonemapping/download/${pkgname}_$pkgver.tar.bz2")
md5sums=('904bf717de6be8f48cfbfbaf4fbdaa43')

build() {
	cd "$srcdir/${pkgname}_$pkgver"
  ./compile.sh
}

package() {
	cd "$srcdir/${pkgname}_$pkgver"
  install -Dm755 tonemapping "$pkgdir/usr/bin/tonemapping"
  install -Dm755 tonemapping_gui "$pkgdir/usr/bin/tonemapping_gui"
}

# vim:set ts=2 sw=2 et:
