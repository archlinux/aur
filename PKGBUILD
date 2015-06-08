# Maintainer: d.woffinden
pkgname=wikititle-git
pkgver=r17.bb8b4da
pkgrel=1
pkgdesc='Simple PHP script for grabbing episode titles out of List of Episodes pages on Wikipedia with the Wikipedia API'
arch=('any')
url='https://github.com/javajawa/wikititle'
license=('BSD')
depends=('php')
makedepends=('git')
source=("$pkgname::git+https://github.com/javajawa/wikititle.git")
md5sums=('SKIP')

# use the number of revisions since beginning of the history
pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  install -D retitle "$pkgdir/usr/bin/retitle"
  install -D wikititle "$pkgdir/usr/bin/wikititle"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

