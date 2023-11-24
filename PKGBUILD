# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=lockit
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple script that makes use of GPG to encrypt and decrypt files and folders"
arch=(x86_64)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(gnupg dialog)
source=(
  "https://software.concise.cc/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.xz"
)
sha512sums=(
  'ac5824c525bea22a21a9a5b6adacdd94a98ef641958c108ac9f1fc66c2682e7a7bdb5e6b64c81b99e084b339d6969d01cfa586452abf0cf51be7692ac6e29ff7'
)
md5sums=(
  '2b3055843a3c812ddf195f8d1e45288f'
)
validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
)

package() {
  cd "$srcdir/${pkgname}-${pkgver}-${pkgrel}-${arch}" >/dev/null 2>&1 ||
  cd "$srcdir/${pkgname}"

  install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

