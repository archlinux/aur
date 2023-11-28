# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

pkgname=github-markdown-toc
pkgver=0.9.1
_pkgver=31e07582cb46c02f80015facf5eff96a76c7db51  # 0.9.1 + commit fixing test
pkgrel=1
pkgdesc='Easy TOC creation for GitHub README.md'
arch=('any')
url='https://github.com/ekalinin/github-markdown-toc'
depends=('bash')
checkdepends=('bash-bats')
license=('MIT')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/ekalinin/github-markdown-toc/archive/$_pkgver.tar.gz")
sha1sums=('17773a03da47848c9b423b3805f0983cfd290c68')

check() {
  cd "$srcdir/$pkgname-$_pkgver"
  make test
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"

  install -Dm755 'gh-md-toc' -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
