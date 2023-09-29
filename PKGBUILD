# Maintainer: Anakojm <https://anakojm.net/a-propos/#contact>

pkgname="basta-git"
pkgver="r33.191cdea"
pkgrel=1
pkgdesc="Bash Status Line"
arch=('any')
url="https://www.kylheku.com/cgit/${pkgname%-git}"
license=('custom:modified two-clause BSD license')
depends=('bash')
makedepends=('git')
source=("$pkgname::git+https://www.kylheku.com/git/${pkgname%-git}")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  install -Dm755 $pkgname/basta.sh "$pkgdir/usr/bin/basta"
}
