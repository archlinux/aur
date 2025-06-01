# Maintainer: Tom Brown <tom@CarlsonSpeed.com>
pkgname='bashdev'
pkgver=0.1.0
pkgrel=1
pkgdesc="A library of reusable Bash functions for script developers."
arch=('any')
url="https://github.com/TomB19/$pkgname"
license=('MIT')
depends=('bash' 'github-cli')  # Replace with actual runtime dependencies
makedepends=('git')
source=("git+https://github.com/TomB16/$pkgname.git#branch=master")
sha256sums=('SKIP')

package() {
  cd "$srcdir" || return 1

  # Install scripts
  #install -Dm755 "$srcdir/$pkgname/src/*"                     "$pkgdir/usr/bin/"
  for f in "$srcdir/$pkgname/src/"*; do
    install -Dm755 "$f" "$pkgdir/usr/bin/$(basename "$f")"
  done


  # License
  install -Dm644 "$srcdir/$pkgname/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname"

}
