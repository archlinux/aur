# Maintainer: <mumei AT airmail DOT cc>

_pkgname=SimpleAgenda
pkgname=simpleagenda.app
pkgrel=1
pkgver=0.44
pkgdesc='Simple calendar and agenda application using GNUstep'
arch=('i686' 'x86_64' 'armv7h')
url='http://wiki.gnustep.org/index.php/SimpleAgenda.app'
license=('BSD')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back' 'libical')
makedepends=('gcc-objc' 'gnustep-make')
optdepends=('addresses.app')
source=("https://github.com/poroussel/simpleagenda/archive/v0.44.tar.gz")
sha256sums=('8c23bc54861ff374277335ef36a55dea9ded0cd99cd90795edb7bdde473b9228')

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
