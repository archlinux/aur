# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=terminal-headers
pkgver=1.3
pkgrel=1
pkgdesc='Color scripts providing a fun greeting when opening a terminal or reloading your shell'
install=terminal-headers.install
arch=(x86_64)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(python-lolcat figlet bc)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '061665c8dbb2b871448187ab00bfb8dfe808b8f03a4fd19c503d074e11063908af25655cbf7a017f3bfbd8518f9278bf8a1cfb6a14e64eeb890b42fe4843b222'
  '432e01a41fc7bfda3787b2f79a4e4899599fd61ebf8f61a99e6e91007cc72ff2c102d9245b15bcedeb2a7b4b49bcce9773ff787b43acbe862ed32c15f79881f5'
  )
md5sums=(
  'c4e8b40f0d810fde917d9d32ea97b54c'
  '0a97d96664688e7b977e84b9d4ab5615'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
  install -Dm755 opt/${pkgname}/* -t "${pkgdir}/opt/${pkgname}"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/terminal-headers/fonts/future.tlf "${pkgdir}/usr/share/terminal-headers/fonts/future.tlf"
}
