# Contributor: Juan Martínez <mratmartinez at anche.no>

pkgname=with-git
_gitname=with
pkgver=r64.28eb40b
pkgrel=1
pkgdesc="Command prefixing for continuous workflow using a single tool"
arch=('any')
url="https://github.com/mchav/with"
license=('Apache-2.0')
makedepends=('git')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_gitname
  install -Dm755 -t "$pkgdir/usr/bin" with
  install -Dm644 with.bash-completion "$pkgdir/usr/share/bash-completion/completions/with"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
