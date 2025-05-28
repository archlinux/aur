# Maintainer: Chris Charabaruk <chris [at] charabaruk [dot] net>
# Contributor: <mumei AT airmail DOT cc>

_pkgname=performance
pkgname=performance
pkgrel=1
pkgver=0.6.0
pkgdesc='High-Performance library for Data Structures manipulation'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/gnustep/libs-performance'
license=('GPL')
groups=('gnustep-libs')
depends=('gnustep-base')
makedepends=('gcc-objc' 'gnustep-make')
source=("https://github.com/gnustep/libs-performance/archive/$pkgname-${pkgver//./_}.tar.gz")
sha256sums=('5f66bfbbe87c2a71d420be41ca7a0fd146c37383754ac128dbb2e3c5fc936daf')

build() {
  cd "libs-performance-$pkgname-${pkgver//./_}"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "libs-performance-$pkgname-${pkgver//./_}"
  make DESTDIR="$pkgdir" install
}
