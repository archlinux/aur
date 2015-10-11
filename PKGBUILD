# Maintainer: Sebastian Wilzbach <sebi [at] wilzbach [dot] me>
# Contributor: Taesoo Kim <tsgatesv@gmail.com>
pkgname=arch-wiki-markdown-git
pkgver=9031de0
pkgrel=1
pkgdesc="Search and read Arch Wiki offline in your terminal"
arch=('any')
url="https://github.com/tsgates/arch-wiki-markdown"
license=('MIT')
source=("git+https://github.com/tsgates/arch-wiki-markdown")
depends=('bash' 'vim')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir"
  git describe --always
}

package() {
  install -d "$pkgdir/usr/share/doc/${pkgname%-*}"
  install -m 0644 $srcdir/${pkgname%-*}/wiki/* "$pkgdir/usr/share/doc/${pkgname%-*}"
  install -Dm 0755 $srcdir/${pkgname%-*}/arch-wiki "$pkgdir/usr/bin/arch-wiki"
}
