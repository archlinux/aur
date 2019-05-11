# Maintainer: <mumei AT airmail DOT cc>

pkgname=gmastermind.app
_pkgname=GMastermind
pkgrel=1
pkgver=0.6
pkgdesc="An implementation of the well-known Mastermind game."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/gap/gmastermind/index.html"
license=('GPL')
groups=('gnustep-games')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/GMastermind-0.6.tar.gz")
sha256sums=('188bb6ebc30838af8e35b7a0bc1af32051ceb0a6011806ada0e7b77e2b07dea7')

build() {
  cd "$_pkgname-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}