# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=mo-git
pkgver=r39.e1b6815
pkgrel=1
pkgdesc="Mustache templates in pure bash"
arch=('i686' 'x86_64')
url="https://github.com/tests-always-included/mo"
license=('MIT')
depends=('bash')
source=("${pkgname}::git+https://github.com/tests-always-included/mo.git")
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Install License (License is in README)
  install -Dm644 $pkgname/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  # Install binary
  install -Dm755 $pkgname/mo "${pkgdir}/usr/bin/mo"
}
