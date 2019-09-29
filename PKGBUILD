# Maintainer: Daniel Pereira <daniel@garajau.com.br>

pkgname=ansible-bundler
pkgver=1.7.0
pkgrel=1
pkgdesc="Turn Ansible playbooks into executable files"
url="https://github.com/kriansa/ansible-bundler"
arch=(any)
license=(custom:BSD)
depends=(ansible)
source=("https://github.com/kriansa/ansible-bundler/archive/v${pkgver}.tar.gz")
sha256sums=(fcd8854956cc2f575016a2dbf2aac66002b7be76ee32820104eeaa99928b4655)

build() {
  cd "$pkgname-$pkgver" || exit 1
  make
}

package() {
  cd "$pkgname-$pkgver" || exit 1

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -r build/pkg/* "$pkgdir"
}
