pkgname=clevis-extra-pins-git
pkgver=r1.6cc22af
pkgrel=1
pkgdesc='A set of additional pins for Clevis binding framework'
arch=(any)
url='https://github.com/anatol/clevis-extra-pins'
license=(MIT)
makedepends=(git)
source=(git+https://github.com/anatol/clevis-extra-pins)
sha512sums=('SKIP')

pkgver() {
  cd clevis-extra-pins
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd clevis-extra-pins
  mkdir -p $pkgdir/usr/bin
  install -m755 clevis-decrypt-yubikey clevis-encrypt-yubikey $pkgdir/usr/bin
}
