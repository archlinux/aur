# Maintainer: <mumei AT airmail DOT cc>

pkgname=gmines.app
_pkgname=GMines 
pkgrel=1
pkgver=0.2
pkgdesc="A clone of the well-known minesweeper game."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/gap/gmines/index.html"
license=('GPL')
groups=('gnustep-games')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/GMines-0.2.tar.gz")
sha256sums=('a7100c9846b548ef2d27c35b80370b30769dca3ac8eeff5f15a227474843c067')

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