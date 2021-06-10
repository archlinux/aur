# Maintainer: <mumei AT airmail DOT cc>

pkgname=gorm
_pkgname=Gorm
pkgrel=1
pkgver=1.2.28
pkgdesc="GNUstep's easy-to-use interface designer"
arch=('i686' 'x86_64')
url="http://www.gnustep.org/experience/Gorm.html"
license=('GPL')
depends=('gnustep-base' 'gnustep-gui')
makedepends=('gcc-objc' 'gnustep-make')
source=(ftp://ftp.gnustep.org/pub/gnustep/dev-apps/gorm-${pkgver}.tar.gz)
sha256sums=('1384900a32838a60e152cc9e83495125e47f34f484adc6cc411b43e7d3b5b6dd')

build() {
  cd "gorm-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "gorm-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
