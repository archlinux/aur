# Maintainer: <mumei AT airmail DOT cc>

_pkgname=GSPdf
pkgname=gspdf.app
pkgrel=1
pkgver=0.5
pkgdesc=' GSPdf is a PDF, PS and EPS viewer for gnustep'
arch=('i686' 'x86_64')
url='http://gap.nongnu.org/gspdf/index.html'
license=('GPL')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back' 'ghostscript')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/GSPdf-0.5.tar.gz")
sha256sums=('b85e2184e90a46aa054d1bf6577fb19f0c3bd953f0e4ff1b8656528d0dfcf88b')

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
