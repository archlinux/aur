# Maintainer: Icarus Mitchellson <mumei AT airmail DOT cc>

pkgname=gorm.app
_pkgname=Gorm
pkgrel=1
pkgver=1.2.24
pkgdesc="GNUstep's easy-to-use interface designer"
arch=('i686' 'x86_64')
url="http://www.gnustep.org/experience/Gorm.html"
license=('GPL')
depends=('gnustep-base' 'gnustep-gui')
makedepends=('gcc-objc' 'gnustep-make')
source=("ftp://ftp.gnustep.org/pub/gnustep/dev-apps/gorm-1.2.24.tar.gz")
sha256sums=('2e0743d10ec191f08ad413701cf907051bb3f6dec7c5526bd02a1e154bdd87cb')

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
