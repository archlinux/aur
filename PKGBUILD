# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=repoup
pkgver=0.1.0
pkgrel=1
pkgdesc="A git repository updater and manager"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=()
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '0ffb00221c180408e9c4927de03ae91f39459dd32de54bb8a1da887d6ca4aee6051c4da0549a425626a1d1ea4ec5f5e131276797ec4672831be3722d04531e9b'
  'f7813acc8993bb54ea0ffa5e0162ca30f22a95edd7db4dbf9c494cdc587cbe52c30da054d50da68ff06d3d0079917cb25e2eca1f876b48437ff54a926abed645'
  )
md5sums=(
  '14693d8295a83d24e7ec5d1c0877963d'
  '0a45d65a419525bad029efef7e303dd7'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 usr/share/repoup/repouprc "${pkgdir}${XDG_CONFIG_HOME:-$HOME/.config}/repoup/repouprc"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
