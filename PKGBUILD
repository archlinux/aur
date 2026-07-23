# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=cooldowns-git
pkgver=r64.4b1ac7c
pkgrel=1
arch=(any)
pkgdesc="🛡️ Dependency cooldowns are cool!"
license=("MIT")
depends=(bash)
makedepends=(git)
url="https://github.com/mprpic/cooldowns"
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")

sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$pkgname"
  install -D cooldowns.sh "$pkgdir/usr/bin/cooldowns"
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

