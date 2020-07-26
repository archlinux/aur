# Maintainer: Daniel Pereira <daniel@garajau.com.br>

pkgname=ansible-bundler
pkgver=1.10.1
pkgrel=1
pkgdesc="Turn Ansible playbooks into executable files"
url="https://github.com/kriansa/ansible-bundler"
arch=(any)
license=(custom:BSD)
depends=(ansible)
source=("https://github.com/kriansa/ansible-bundler/archive/v${pkgver}.tar.gz")
sha256sums=(8bb3f472024079e6338b3f1700370a094355c7e9f4b34bbd0787489cc6f99c3e)

build() {
  cd "$pkgname-$pkgver" || exit 1
  make
}

package() {
  cd "$pkgname-$pkgver" || exit 1

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -r build/pkg/* "$pkgdir"
}
