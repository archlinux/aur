pkgname=iostem-git
pkgver=1.0.r0.g0000000
pkgrel=1
pkgdesc="Header-only iostem C++ library"
arch=('any')
url="https://github.com/Szerwigi1410/iostem"
license=('MIT')
depends=()
makedepends=('git')

source=("git+https://github.com/Szerwigi1410/iostem.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/iostem"
  git describe --long --tags 2>/dev/null || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/iostem"
  install -Dm644 iostem.hpp "$pkgdir/usr/include/iostem.hpp"
  install -Dm644 iostem "$pkgdir/usr/include/iostem"
  install -Dm644 iostem98.hpp "$pkgdir/usr/include/iostem98.hpp"
}
