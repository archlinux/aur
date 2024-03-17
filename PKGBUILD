# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

pkgname=github-markdown-toc
pkgver=0.10.0
pkgrel=1
pkgdesc='Easy TOC creation for GitHub README.md'
arch=('any')
url='https://github.com/ekalinin/github-markdown-toc'
depends=('bash')
checkdepends=('bats')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ekalinin/github-markdown-toc/archive/$pkgver.tar.gz")
sha1sums=('8dde36ca28578d70ec7fb073085b658b9d5f0a97')

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 'gh-md-toc' -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
