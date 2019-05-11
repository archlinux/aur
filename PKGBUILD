# Maintainer: <mumei AT airmail DOT cc>

pkgname=lapispuzzle.app
_pkgname=LapisPuzzle  
pkgrel=1
pkgver=1.2
pkgdesc="A tetris-like game."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/gap/lapispuzzle/index.html"
license=('GPL')
groups=('gnustep-games')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/LapisPuzzle-1.2.tar.gz")
sha256sums=('883b104c4223ad90f8f5e83573f8b93b05abb9863492aef0ac23e929868c47b9')

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