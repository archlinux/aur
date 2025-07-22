pkgname=msi-ge66-raider-rgb-git
pkgver=0.1.0
pkgrel=1
pkgdesc="MSI GE66 Raider RGB - A tool to control the RGB lighting of the MSI GE66 Raider laptop"
arch=('x86_64')
url="https://github.com/luisalbertopm/msi-ge66-raider-rgb"
license=('GPL')
depends=('gcc-libs' 'glibc' 'hidapi' 'libcap' 'systemd-libs')
makedepends=('cmake' 'git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 build/msi-rgb "$pkgdir/usr/bin/msi-rgb"
}
