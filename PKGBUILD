# Maintainer: <mumei AT airmail DOT cc>

pkgname=rsskit
_pkgname=RSSKit
pkgrel=1
pkgver=0.4
pkgdesc="Simple library for reading the different types of RSS file formats."
arch=('i686' 'x86_64')
url="http://gap.nongnu.org/grr/index.html"
license=('GPL')
groups=('gnustep-libs')
depends=('gnustep-base' 'gnustep-back')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/RSSKit-0.4.tar.gz")
sha256sums=('5dffff7005468aacc45c117a1c86b0d0e72e0d617b35c79b820973390b3a8886')

build() {
  cd "$_pkgname-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
