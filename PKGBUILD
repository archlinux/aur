# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=terminal-headers
pkgver=1.2
pkgrel=1
pkgdesc='Scripts providing a fun and colorful greeting when opening a terminal'
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
  '0e2647ae8b29017ebce179aa9e513d3a2302c69354955b5e37c879db95b549551058ef4f66e3da7e1eccbb61ca79aab1bf49d35d57b1ab55d5bc995ce0ffa4f2'
  '6a12b4993fa64c3b209ace7b494ee625304702b6a102ad75d4dc4ed27ebd2ae60aa042b67390ffddc81dd9afbfab6d8fb9a2a22436e265815c8691566def7f64'
  )
md5sums=(
  'fb7331dd753a2f2264e556ee0748821a'
  '4f5d3cb789c7a85b9b03f835807928f5'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
  install -Dm755 opt/${pkgname}/* -t "${pkgdir}/opt/${pkgname}"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/terminal-headers/fonts/future.tlf "${pkgdir}/usr/share/terminal-headers/fonts/future.tlf"
}
