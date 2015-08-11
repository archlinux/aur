# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=decompose-git
pkgver=r21.6632368
pkgrel=1
pkgdesc="Development Environment Compose - templating framework to help developers easily create and switch environments"
arch=('i686' 'x86_64')
url="https://github.com/dmp1ce/decompose"
license=('custom')
depends=('bash' 'mo-git')
source=("${pkgname}::git+https://github.com/dmp1ce/decompose.git")
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Install License (License is in README)
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install binary
  install -Dm755 $pkgname/decompose "${pkgdir}/usr/bin/decompose"
}
