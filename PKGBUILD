# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=terminal-headers
pkgver=1.2
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
  'b444bda1fb5d80a6e56699cbc7f3dbff50c71973e20450434dede94f2f898bf0b00e7b080333d9e97a48bac8ea8938fc9ac839511f3d4c89c39899b9ef6bc6a5'
  '7286c709531b74d459d21ec795f4b27d895bd10ca07cc0363dceff2d226453eb623823278759f2424c4605d8f8a9252d4338bc7d0cdc1df2d9fb76ea540dc021'
  )
md5sums=(
  '50c9931abe529ce41b2f71f7bb057561'
  '7160a00137a62e1a6bf7edc265670735'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
  install -Dm755 opt/${pkgname}/* -t "${pkgdir}/opt/${pkgname}"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/terminal-headers/fonts/future.tlf "${pkgdir}/usr/share/terminal-headers/fonts/future.tlf"
}
