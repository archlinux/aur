# Maintainer: Thomas Weingartner <tom@weingoworks.com>
pkgname=flooxs
pkgver=2024.0.0
pkgrel=1
pkgdesc="FLorida Object-Oriented Process/Device Simulator"
arch=('x86_64')
url="https://flooxs.org/"
options=(!lto)
license=('Special')
depends=(
  'plplot'
  'suitesparse'
)
source=("${pkgname}-${pkgver}-Linux.tar.gz::http://flooxs.org/packages/${pkgname}-${pkgver}-Linux.tar.gz")
sha256sums=('e6f4329f6b5826d01e3093fcf5cf576d130d6ca54db8e4b658bd0dd94efd6e68')

# build() {
#   export GOPATH="$srcdir"/gopath
#   export CGO_CPPFLAGS="${CPPFLAGS}"
#   export CGO_CFLAGS="${CFLAGS}"
#   export CGO_CXXFLAGS="${CXXFLAGS}"
#   export CGO_LDFLAGS="${LDFLAGS}"
#   export CGO_ENABLED=1
# 
#   cd "$srcdir/$pkgname-$pkgver"
#   make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" build
# }

package() {
  cd "$srcdir/$pkgname-$pkgver-Linux"
  install -d $pkgdir/usr/bin
  install bin/flooxs $pkgdir/usr/bin
  for i in $(find share -type f)
  do
          install -d $pkgdir/usr/$(dirname $i)
          install -m 644 $i $pkgdir/usr/$(dirname $i)
  done
  # cp $startdir/install.sh .
  # ./install.sh
}
