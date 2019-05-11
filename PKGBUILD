# Maintainer: <mumei AT airmail DOT cc>

_pkgname=Graphos
pkgname=graphos.app
pkgrel=1
pkgver=0.7
pkgdesc='Vector drawing application centered around bezier paths'
arch=('i686' 'x86_64' 'armv7h')
url='http://gap.nongnu.org/graphos/index.html'
license=('GPL2')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/Graphos-0.7.tar.gz")
sha256sums=('d2a2567d244787a56572733cc91ca02ceb1030dfbd54401aa86e26650c34810b')

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
