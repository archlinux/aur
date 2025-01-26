pkgname=nfu-git
pkgver=r354.0e7c830
pkgrel=1
pkgdesc="Numeric Fu for the command line"
arch=('any')
url="https://github.com/spencertipping/nfu"
license=('MIT')
depends=('perl' 'perl-json')
makedepends=('git')
provides=('nfu')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd nfu
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd nfu
  install -Dm755 nfu -t "$pkgdir/usr/bin"
  install -Dm644 *.md -t "$pkgdir/usr/share/doc/$pkgname"
}
