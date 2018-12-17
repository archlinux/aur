# Maintainer: Jan Hrdina <jan dot hrdka at gmail dot com>
# Contributor: Bram Swenson <bram at craniumisajar dot com> PGP-Key: 9E93532D99D643C0

pkgname=dynalist-desktop
pkgver=1.0.4
pkgrel=1
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
  "7c7a2085098ee894769ae0d2baaa942314e01d564415bc6ff89e2723284526c926612b50ca709b140121371fe4176080a0972f77e29d89b8d27ff0fe404cd08b"
  "8b913201873111a0460fd572823c631746bd91b7946a2794d80992fa73e93053949b7e6354ebdb0d7486217238dc55217797fe270401e8dde2674535eaf1eddf"
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
