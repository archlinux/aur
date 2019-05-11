# Maintainer: <mumei AT airmail DOT cc>

_pkgname=GShisen
pkgname=gshisen.app
pkgrel=1
pkgver=1.3.0
pkgdesc='Shisen-sho puzzle game for GNUstep'
arch=('i686' 'x86_64')
url='http://www.nongnu.org/gap/gshisen/index.html'
license=('GPL')
groups=('gnustep-games')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/GShisen-1.3.0.tar.gz")
sha256sums=('f904621f70cccc2efa70698c21a78049870fb4305775f9a04ecf7f7a7f4a5dfe')

build() {
  cd $_pkgname-$pkgver
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}