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
  'f82d0513718515d494dfc229f669268c81cd94b83295f88092a09a38563ea034d8b95af48375c492cefeb2489dd90bec1d547bf94a2a75e1fca354b3b35c7307'
  'aac95dfbd35ea16fb96d6612a0b898f9ca786cb69ae4fd794069dc93dcd3402c9d1529f8a726ee0928bdcc3552592f216eaa13e6bec611649de7b01fc7ec9bcf'
  )
md5sums=(
  '8ac7060b0fcacfb5ce9c49163f7cbfc1'
  '7e1797258f0bb26ff0916eded6a02547'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
  install -Dm755 opt/${pkgname}/* -t "${pkgdir}/opt/${pkgname}"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/terminal-headers/fonts/future.tlf "${pkgdir}/usr/share/terminal-headers/fonts/future.tlf"
}
