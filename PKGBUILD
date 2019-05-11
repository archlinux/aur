# Maintainer: <mumei AT airmail DOT cc>

pkgname=batmon.app
_pkgname=batmon
pkgrel=1
pkgver=0.8
pkgdesc="A battery monitor for laptops"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/gap/batmon/index.html"
license=('GPL')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/batmon-0.8.tar.gz")
sha256sums=('fff2fc242ea2956f8b8c7eea751718c54d1a70026eb4659869ad1bac9f64dcff')

build() {
  cd "$_pkgname-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}