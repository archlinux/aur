# Maintainer: Icarus Mitchellson <mumei AT airmail DOT cc>

_pkgname=Affiche
pkgname=affiche.app
pkgrel=1
pkgver=0.6.0
pkgdesc='An application to "stick" little notes on the desktop'
arch=('i686' 'x86_64' 'armv7h')
url='https://packages.debian.org/stretch/gnustep/affiche.app'
license=('GPL')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://http.debian.net/debian/pool/main/a/affiche/affiche_0.6.0.orig.tar.gz")
sha256sums=('4bb170c4c33cc84cc5ecb87c02395154426f4dd9d9e3a97d45782317b70e1de4')

build() {
  cd "affiche-$pkgver.orig"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "affiche-$pkgver.orig"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}