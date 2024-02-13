pkgname=clevis-pin-fido2-git
pkgver=r3.acbc254
pkgrel=1
pkgdesc='Clevis pin fido2'
arch=(any)
url='https://github.com/olastor/clevis-pin-fido2'
license=(MIT)
makedepends=(git)
depends=(bash)
source=(git+https://github.com/olastor/clevis-pin-fido2)
sha512sums=('SKIP')

pkgver() {
  cd clevis-pin-fido2
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd clevis-pin-fido2
  install -Dm755 -t "$pkgdir/usr/bin" clevis-decrypt-fido2 clevis-encrypt-fido2
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
