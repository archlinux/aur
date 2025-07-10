# PKGBUILD
pkgname=pattern-renamer
pkgver=0.0.7
pkgrel=2
pkgdesc="CLI to rename terms/words in a project or normal folders with multiple different patterns"
arch=('any')
url="https://github.com/alissonbk/pattern-renamer"
license=('MIT')
depends=('bash')
source=("$pkgname::git+$url.git")
md5sums=('SKIP')
ignored_folders="pr-ignored-folders.cfg"

# pkgver() {
#   cd "$srcdir/$pkgname"
#   git describe --tags | sed 's/-.*//' | sed 's/v//'
# }

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 "$ignored_folders" "${pkgdir}/etc/$ignored_folders"
  install -Dm755 pattern-renamer.static "$pkgdir/usr/bin/pattern-renamer"
}
