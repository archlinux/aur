# Maintainer: Daniel Pereira <daniel@garajau.com.br>

pkgname=ansible-bundler
pkgver=1.8.0
pkgrel=1
pkgdesc="Turn Ansible playbooks into executable files"
url="https://github.com/kriansa/ansible-bundler"
arch=(any)
license=(custom:BSD)
depends=(ansible)
source=("https://github.com/kriansa/ansible-bundler/archive/v${pkgver}.tar.gz")
sha256sums=(21b3eeee479c9859856d87a3ce122cbac7967ba5daa8be28d8a37c6c6eafd607)

build() {
  cd "$pkgname-$pkgver" || exit 1
  make
}

package() {
  cd "$pkgname-$pkgver" || exit 1

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -r build/pkg/* "$pkgdir"
}
