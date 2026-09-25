# Maintainer: kusanaginoturugi <kusanaginoturugi(at)gmail.com>

pkgname=manglow
pkgver=0.3.0
pkgrel=1
pkgdesc="Render man pages as Markdown with glow"
arch=('any')
url="https://github.com/kusanaginoturugi/manglow"
license=('MIT')
depends=('fzf' 'glow' 'man-db' 'pandoc-cli')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4943404fca6da1ecf9ad98f06befe8aef6c03ed67ebe38f537d60036b5fc3c31')

check() {
  cd "$srcdir/$pkgname-$pkgver"
  sh tests/test.sh
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 manglow "${pkgdir}/usr/bin/manglow"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
