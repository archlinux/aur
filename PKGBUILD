# Maintainer: <mumei AT airmail DOT cc>

_pkgname=SimpleAgenda
pkgname=simpleagenda.app
pkgrel=1
pkgver=0.46
pkgdesc='Simple calendar and agenda application using GNUstep'
arch=('i686' 'x86_64' 'armv7h')
url='http://wiki.gnustep.org/index.php/SimpleAgenda.app'
license=('BSD')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back' 'libical')
makedepends=('gcc-objc' 'gnustep-make')
optdepends=('addresses.app')
source=("https://github.com/poroussel/simpleagenda/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "simpleagenda-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "simpleagenda-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
