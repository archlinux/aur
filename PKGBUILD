# Maintainer:  Ilya Chelyadin <ilya77105@gmail.com>

pkgname=rastertokpsl-git
pkgver=1
pkgrel=2
pkgdesc='rastertokpsl CUPS filter for Kyocera printers built from source'
arch=('i686' 'x86_64')
url="https://github.com/brainrom/rastertokpsl-re"
license=('Apache 2.0')
depends=('cups')
makedepends=('git' 'cmake')
provides=("rastertokpsl=${pkgver}")
conflicts=('rastertokpsl' 'rastertokpsl-fs-1040')
source=('git+https://github.com/brainrom/rastertokpsl-re.git')
sha256sums=('SKIP')

build()
{
  mkdir -p build
  cd build
  cmake ../rastertokpsl-re
  cmake --build .
}

package()
{
  install -D -m 0755 $srcdir/build/src/rastertokpsl-re "$pkgdir/usr/lib/cups/filter/rastertokpsl-bin"
  install -D -m 0755 $srcdir/rastertokpsl-re/rastertokpsl_wrapper "$pkgdir/usr/lib/cups/filter/rastertokpsl"
}
