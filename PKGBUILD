pkgname=arch-cache-cleaner-git
pkgver=r0.0
pkgrel=5
pkgdesc='Interactive cross-platform cache cleaner with configurable profiles (Linux/macOS/Windows)'
arch=('any')
url='https://github.com/MeIsGaming/arch-cache-cleaner'
license=('MIT')
depends=('python')
optdepends=('sudo: remove root-owned cache entries')
provides=('arch-cache-cleaner')
conflicts=('arch-cache-cleaner')
source=('git+https://github.com/MeIsGaming/arch-cache-cleaner.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/arch-cache-cleaner"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/arch-cache-cleaner"

  install -Dm755 cache_cleaner.py "$pkgdir/usr/bin/arch-cache-cleaner"
  install -Dm644 cache_paths.json "$pkgdir/usr/share/arch-cache-cleaner/cache_paths.json"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
