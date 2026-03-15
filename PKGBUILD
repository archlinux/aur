# Maintainer: feby <feby@computer.com>
pkgname=interpkit
pkgver=2.0.0
pkgrel=1
pkgdesc="A fast, lightweight CLI helper tool to speed up data lookup from engineering tables (d/L function)."
arch=('x86_64' 'aarch64')
url="https://github.com/lainx86/InterpKit"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'git')
source=("git+https://github.com/lainx86/InterpKit.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/InterpKit"
  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build -j$(nproc)
}

package() {
  cd "${srcdir}/InterpKit"
  install -Dm755 build/interpkit "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
