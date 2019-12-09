# Maintainer: Daniel Pereira <daniel@garajau.com.br>

pkgname=ansible-bundler
pkgver=1.7.1
pkgrel=1
pkgdesc="Turn Ansible playbooks into executable files"
url="https://github.com/kriansa/ansible-bundler"
arch=(any)
license=(custom:BSD)
depends=(ansible)
source=("https://github.com/kriansa/ansible-bundler/archive/v${pkgver}.tar.gz")
sha256sums=(add254944d13daa94e7390ade3c0a1b8f73b295e7552d4577994d532cc24fc53)

build() {
  cd "$pkgname-$pkgver" || exit 1
  make
}

package() {
  cd "$pkgname-$pkgver" || exit 1

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -r build/pkg/* "$pkgdir"
}
