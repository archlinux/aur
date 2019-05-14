# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=unbound-block-hosts
pkgver=0+21+87966ee
_commit=87966ee571cdeb78b89d16aac48d8fa2935ad6b2
pkgrel=2
pkgdesc="Script to convert an ad-blocking hosts file (Dan Pollock's, by default) into Unbound local-data"
arch=(any)
url=https://github.com/gbxyz/unbound-block-hosts
license=(GPL)
depends=(perl-lwp-protocol-https)
source=(git+$url#commit=$_commit)
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  printf 0+%s+%s $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package() {
  cd $pkgname
  install -D unbound-block-hosts -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/unbound-block-hosts
}
