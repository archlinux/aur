# Maintainer: yogramming <your-email>

pkgname=smart-clone
pkgver=1.0.0
pkgrel=1
pkgdesc="Provider-aware Git cloning tool that auto-organizes repositories into ~/src/<provider>/<owner>/<repo>"
arch=('any')
url="https://github.com/yogramming/smart-clone"
license=('MIT')
depends=('git')
makedepends=('curl')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/smart-clone-$pkgver"

  # Install executable as `clone`
  install -Dm755 clone.sh "$pkgdir/usr/bin/clone"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Docs
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
