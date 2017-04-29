pkgname=scorch-git
pkgver=r16.301af6a
pkgrel=1
pkgdesc="discover silent corruption on a filesystem"
arch=('any')
url="https://github.com/trapexit/scorch"
license=('GPL')
depends=('python')
makedepends=('git')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 scorch  "$pkgdir/usr/bin/scorch"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
