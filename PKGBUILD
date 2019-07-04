# Maintainer: <mumei AT airmail DOT cc>

_pkgname=performance
pkgname=performance
pkgrel=1
pkgver=0.5.0
pkgdesc='High-Performance library for Data Structures manipulation'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/gnustep/libs-performance'
license=('GPL')
groups=('gnustep-libs')
makedepends=('gcc-objc' 'gnustep-make')
source=("https://github.com/gnustep/libs-performance/archive/performance-0_5_0.tar.gz")
sha256sums=('fb17a1fb812f3e176b087a56ff753f1148e4bdca0103ed0113f21a5cb1c9a669')

build() {
  cd "libs-performance-performance-0_5_0"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd libs-performance-performance-0_5_0
  make DESTDIR="$pkgdir" install
}
