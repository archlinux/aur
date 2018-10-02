# Maintainer: Icarus Mitchellson <mumei AT airmail DOT cc>

pkgname=gorm.app
_pkgname=Gorm
pkgrel=1
pkgver=1.2.23
pkgdesc="GNUstep's easy-to-use interface designer"
arch=('i686' 'x86_64')
url="http://www.gnustep.org/experience/Gorm.html"
license=('GPL')
depends=('gnustep-base' 'gnustep-gui')
makedepends=('gcc-objc' 'gnustep-make')
source=("ftp://ftp.gnustep.org/pub/gnustep/dev-apps/gorm-1.2.23.tar.gz")
sha256sums=('cbd25abbbc85d81d50111be75da14aabce368337694948c95b68b6fdf74eeea2')

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
