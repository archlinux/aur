# Maintainer: Hoang-Ngan Nguyen zhoangngan@gmail.com
pkgname=rseye-git
_pkgname=rseye
pkgver=r39.0babe11
pkgrel=1
pkgdesc="Freeze screen regularly to help prevent Repetitive Strain
Injury (RSI) and protect the eyes."
arch=('i686' 'x86_64')
url="https://github.com/hoangngan82/$_pkgname"
license=('MIT')
depends=(libxrender)
makedepends=(git)
source=("git+https://github.com/hoangngan82/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  install -D "$srcdir/$_pkgname/rseye" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname/rseye.1.gz" "$pkgdir/usr/share/man/man1/rseye.1.gz"
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
