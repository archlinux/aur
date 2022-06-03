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
  'dad4fba32d28a526cbf4821d3879886225ccdca5e11e700fb3ace6017bc98123a980076d3b5a39f42634b3dacd8ae4c72e5d976e50e8c9c1ca71be4e9a7b6ab8'
  'f51e5bd4c8b6fb19afe05200fce31693a111127903cdd321c5d865cad10bc10ab68bfae608beb336dfc0030fdd4d81b5124dfc0e0d5490e30b682da35f010cdd'
  )
md5sums=(
  '88f1bc2f99644ed384e9a8f54f9ed688'
  'fc57b79d163ee399f4d999eef0502c7c'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
  install -Dm755 opt/${pkgname}/* -t "${pkgdir}/opt/${pkgname}"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/terminal-headers/fonts/future.tlf "${pkgdir}/usr/share/terminal-headers/fonts/future.tlf"
}
