# Maintainer: Bram Swenson <bram at craniumisajar dot com> PGP-Key: 9E93532D99D643C0

pkgname=dynalist-desktop
pkgver=1.0.2
pkgrel=3
pkgdesc="Dynalist lets you organize your ideas and tasks in simple lists. It's powerful, yet easy to use."
arch=("any")
url="https://dynalist.io"
license=(Private)
makedepends=("tar" "wget")
provides=("dynalist")
source=(
  "dynalist.tar.gz::https://dynalist.io/standalone/download?file=dynalist.tar.gz"
  "dynalist.desktop"
  "icon.png"
)
sha512sums=(
  "18dc5dc0c6d510c85fa7b979e81d4eca39a328047ecc0c1a064042c3a98ad90df12cc41c10b1907cbd2ec7a5a7c485a8d9af2fd6866cdd034a7f1add9d336aa7"
  "45db3d2068fbd4eb58a73a3244064aacb8410f934a08309f525faca21f321c6e1c38cffb9ebefcafdcc6903496e2b21cba679263d848e8b35a3f0388e95e8ade"
  "80b8c4d7749905f4163caf5fc8d74bb139cad782f74242870ee5f6a107059b780ad779117107690af4ec6b059f1cc52f4f4627476d0499a2fa54e4ea9ca645e8"
)

package() {
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/opt"
  cp -a "dynalist-${pkgver}" "${pkgdir}/opt/dynalist" 
  install -Dm755 "icon.png" "${pkgdir}/opt/dynalist/icon.png"
  install -Dm755 "dynalist.desktop" "${pkgdir}/usr/share/applications/dynalist.desktop"
  ln -sf "${pkgdir}/opt/dynalist/dynalist" "${pkgdir}/usr/bin/dynalist"
}

# vim:set ts=2 sw=2 et:
