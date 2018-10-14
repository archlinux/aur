# Maintainer: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
_pkgname=Sniffles
pkgname=sniffles
pkgver=1.0.10
pkgrel=1
pkgdesc="Structural variation caller using third generation sequencing"
arch=('x86_64')
url="https://github.com/fritzsedlazeck/Sniffles"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake')
options=('!emptydirs')
source=("$_pkgname-$pkgver.tar.gz"::"https://github.com/fritzsedlazeck/Sniffles/archive/v$pkgver.tar.gz")
md5sums=('0d952541c9ae0e50af0d20e99cb87f11')

build() {
  cd "$_pkgname-$pkgver"
  mkdir build
  cd build
  cmake \
    -DCMAKE_COLOR_MAKEFILE:BOOL='ON' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Wno-dev \
    ..
  make
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dpm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dpm755 "bin/$pkgname-core-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
