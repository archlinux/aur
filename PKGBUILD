# Maintainer: ny-a <nyaarch64@gmail..com>

pkgname=ecspresso
pkgver=1.6.2
pkgrel=1
pkgdesc="Deployment tool for Amazon ECS"
arch=('x86_64')
url="https://github.com/kayac/ecspresso"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://github.com/kayac/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4c24e13aa96495c48c934521b902701bfd680cb44c132c1e97552b55119f9bc4')

build() {
  cd "$pkgname-$pkgver"

  go build "./cmd/$pkgname"
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
