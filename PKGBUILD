# Maintainer: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
_pkgname=Sniffles
pkgname=sniffles
pkgver=1.0.9
pkgrel=1
pkgdesc="Structural variation caller using third generation sequencing"
arch=('x86_64')
url="https://github.com/fritzsedlazeck/Sniffles"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake')
options=('!emptydirs')
source=("$_pkgname-$pkgver.tar.gz"::"https://github.com/fritzsedlazeck/Sniffles/archive/v$pkgver.tar.gz")
md5sums=('7e5a2a43b18ba65803f56d893c59d87b')

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
  install -Dpm755 "bin/$pkgname-core-1.0.8/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
