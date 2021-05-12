# Maintainer: <mumei AT airmail DOT cc>

pkgname=gorm.app
_pkgname=Gorm
pkgrel=1
pkgver=1.2.28
pkgdesc="GNUstep's easy-to-use interface designer"
arch=('i686' 'x86_64')
url="http://www.gnustep.org/experience/Gorm.html"
license=('GPL')
depends=('gnustep-base' 'gnustep-gui')
makedepends=('gcc-objc' 'gnustep-make')
source=("ftp://ftp.gnustep.org/pub/gnustep/dev-apps/gorm-$pkgver.tar.gz")
sha256sums=('8a4f377f57637e415b2fdd93e0945e3652f9c25f53205aa0cad0198ed1537c37')

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
