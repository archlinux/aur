# PKGBUILD
pkgname=pattern-renamer
pkgver=0.0.4
pkgrel=1
pkgdesc="CLI to rename terms/words in your project that with multiple different patterns"
arch=('any')
url="https://github.com/alissonbk/pattern-renamer"
license=('MIT')
depends=('bash')
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/-.*//' | sed 's/v//'
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 pattern-renamer.static "$pkgdir/usr/bin/pattern-renamer"
}
