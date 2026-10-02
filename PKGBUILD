# Maintainer: Oliver Weissbarth <mail@oweissbarth.de>
pkgname=subprocessh-git
pkgver=r91.8a4715c
pkgrel=1
pkgdesc="A simple one header solution to launching processes and interacting with them for C/C++."
arch=('x86_64')
url="https://github.com/sheredom/subprocess.h"
license=('UNLICENSE')
depends=()
source=("$pkgname::git+https://github.com/sheredom/subprocess.h.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  install -Dm644 "$srcdir/$pkgname/subprocess.h" "$pkgdir/usr/include/subprocess.h"
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
