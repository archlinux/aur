pkgname=clevis-extra-pins-git
pkgver=r62.1714f84
pkgrel=1
pkgdesc='A set of additional pins for Clevis binding framework'
arch=(any)
url='https://github.com/anatol/clevis.go'
license=(MIT)
makedepends=(git)
source=(git+https://github.com/anatol/clevis.go)
sha512sums=('SKIP')

pkgver() {
  cd clevis.go
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd clevis.go
  mkdir -p $pkgdir/usr/bin
  install -m755 clevis-decrypt-yubikey clevis-encrypt-yubikey clevis-encrypt-remote $pkgdir/usr/bin
}
