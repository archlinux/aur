# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=metabuli
_tag=1.2.0
pkgver=1.2.0
pkgrel=2
pkgdesc="Specific and sensitive metagenomic classification via joint amino acid and DNA k-mer analysis"
arch=('x86_64')
url="https://github.com/steineggerlab/Metabuli"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cmake')
conflicts=('metabuli-bin')
source=("Metabuli-$pkgver.tar.gz::$url/archive/${_tag}.tar.gz")
sha256sums=('2cdeff949676852276930b9fb14c564b50fbc3c48b9c2f903531fc3d1bd3f50c')

build() {
  cd "$srcdir/Metabuli-$pkgver"
  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$srcdir/Metabuli-$pkgver"
  install -Dm755 build/src/metabuli "$pkgdir/usr/bin/metabuli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
