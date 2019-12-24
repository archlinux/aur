# Maintainer: Daniel Pereira <daniel@garajau.com.br>

pkgname=ansible-bundler
pkgver=1.9.0
pkgrel=1
pkgdesc="Turn Ansible playbooks into executable files"
url="https://github.com/kriansa/ansible-bundler"
arch=(any)
license=(custom:BSD)
depends=(ansible)
source=("https://github.com/kriansa/ansible-bundler/archive/v${pkgver}.tar.gz")
sha256sums=(fd424645d94218bcf31f4fdd42078b641cbf5632ca77c98aa64d795e37c63266)

build() {
  cd "$pkgname-$pkgver" || exit 1
  make
}

package() {
  cd "$pkgname-$pkgver" || exit 1

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -r build/pkg/* "$pkgdir"
}
