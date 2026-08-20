# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=foldcomp
_tag=v1.0.0
pkgver=1.0.0
pkgrel=2
pkgdesc="Compress and index protein structures with torsion angles"
arch=('x86_64')
url="https://github.com/steineggerlab/foldcomp"
license=('MIT')
depends=('zlib' 'gcc-libs')
makedepends=('cmake')
conflicts=('foldcomp-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${_tag}.tar.gz")
sha256sums=('6a9aecf0d926bd280a489f29c86e3e26e054712b018e36d9c1b5f7b5e5e1d1c5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 build/foldcomp "$pkgdir/usr/bin/foldcomp"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
