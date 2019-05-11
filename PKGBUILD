# Maintainer: <mumei AT airmail DOT cc>

_pkgname=TalkSoup
pkgname=talksoup.app
pkgrel=1
pkgver=1.1
pkgdesc='IRC client for GNUstep and Mac OS X'
arch=('i686' 'x86_64' 'armv7h')
url='http://gap.nongnu.org/talksoup/index.html'
license=('GPL2')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back' 'netclasses')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/TalkSoup-1.1.tar.gz")
sha256sums=('3a469c66ce3067a88603d6ebae6f63fbcfad55586dd5455179887f28e5a63ae7')

build() {
  cd "$_pkgname-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR=$pkgdir install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
