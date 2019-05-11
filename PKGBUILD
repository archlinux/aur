# Maintainer: <mumei AT airmail DOT cc>

_pkgname=LuserNET
pkgname=lusernet.app
pkgrel=1
pkgver=0.4.3
pkgdesc='NNTP-based(usenet) news reader'
arch=('i686' 'x86_64' 'armv7h')
url='http://wiki.gnustep.org/index.php/LuserNET.app'
license=('LGPL2')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back' 'pantomime')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://download.savannah.nongnu.org/releases/gnustep-nonfsf/LuserNET-0.4.3.tar.gz")
sha256sums=('5b96eb6eca35cd549c54abd60412eb3c753de341965735f3a25c7d7e8452d3e1')

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