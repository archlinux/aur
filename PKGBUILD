# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=buildhosts
pkgname=$_pkgname-git
pkgver=20150202.r9.719a8e7
pkgrel=1
pkgdesc='Download and use custom hosts sources to build /etc/hosts'
url='https://github.com/prurigro/buildhosts'
license=('MIT')
arch=('any')
depends=('curl')
makedepends=('git')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm755 p2p-to-hosts "$pkgdir/usr/bin/p2p-to-hosts"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
