# Maintainer: <mumei AT airmail DOT cc>

_pkgname=Pantomime
pkgname=pantomime
pkgrel=1
pkgver=1.3.0
pkgdesc='Set of Objective-C classes that model a mail system.'
arch=('i686' 'x86_64' 'armv7h')
url='http://wiki.gnustep.org/index.php/GNUMail'
license=('GPL2')
groups=('gnustep-libs')
depends=('gnustep-base' 'gnustep-gui')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://download.savannah.nongnu.org/releases/gnustep-nonfsf/Pantomime-1.3.0.tar.gz")
sha256sums=('935845b67ec4cf32596828091dc41f3599ca8870ab9085891c365be23094b910')

build() {
  cd "$_pkgname-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}

