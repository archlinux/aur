pkgname=netchecker
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple network checker with JSON configuration"
arch=('any')
url="https://github.com/radlesner/netchecker"
license=('GPL-2.0')
depends=('bash' 'jq' 'iputils')
makedepends=('git')

source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"

  install -Dm755 netchecker "$pkgdir/usr/bin/netchecker"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
