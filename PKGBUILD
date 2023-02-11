# Maintainer: <mumei AT airmail DOT cc>

_pkgname=Pantomime
pkgname=pantomime
pkgrel=1
pkgver=1.4.0
pkgdesc='Set of Objective-C classes that model a mail system.'
arch=('i686' 'x86_64' 'armv7h')
url='http://wiki.gnustep.org/index.php/GNUMail'
license=('GPL2')
groups=('gnustep-libs')
depends=('gnustep-base' 'gnustep-gui')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://download.savannah.nongnu.org/releases/gnustep-nonfsf/$_pkgname-$pkgver.tar.gz")
sha256sums=('90a58c71b75a655e75cfe0db3480b221639c3ebe5e0af279fd6eafb2941438f8')

build() {
  cd "$_pkgname-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}

