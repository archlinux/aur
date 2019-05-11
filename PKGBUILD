# Maintainer: <mumei AT airmail DOT cc>

pkgname=highlighterkit
_pkgname=HighlighterKit
pkgrel=1
pkgver=0.1.3
pkgdesc="A framework to allow easy incorporation of syntax highlighting features into your application"
arch=('i686' 'x86_64')
url="http://wiki.gnustep.org/index.php/HighlighterKit"
license=('GPL')
groups=('gnustep-libs')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://download.savannah.nongnu.org/releases/gnustep-nonfsf/HighlighterKit-0.1.3.tar.gz")
sha256sums=('cae933c9e402352ae70e96cbe70a52dd504b5d8efd5910cc4c3ff35a29fba86c')

build() {
  cd "$_pkgname-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
