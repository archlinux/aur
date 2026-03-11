# Maintainer: mellen <mellen@heatsync.org>
pkgname=cmdchamp-git
pkgver=r345.b4d8442
pkgrel=1
pkgdesc='CLI command trainer with spaced repetition, boss fights, and sandbox execution'
arch=('any')
url='https://github.com/mellen9999/cmdchamp'
license=('MIT')
depends=('bash' 'bubblewrap')
makedepends=('git')
provides=('cmdchamp')
conflicts=('cmdchamp')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -Dm755 cmdchamp "$pkgdir/usr/bin/cmdchamp"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
