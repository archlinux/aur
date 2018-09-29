# Maintainer: Icarus Mitchellson <mumei AT airmail DOT cc>

_pkgname=StepSync
pkgname=stepsync.app
pkgrel=1
pkgver=1.0
pkgdesc='A a file and folder synchronization tool'
arch=('i686' 'x86_64' 'armv7h')
url='http://gap.nongnu.org/stepsync/index.html'
license=('GPL')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/StepSync-1.0.tar.gz")
sha256sums=('97ccd23828280ba54235240413718bb96c7403763709848ef327e3cb93e39d38')

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
