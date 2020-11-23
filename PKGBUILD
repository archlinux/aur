pkgname=notedown
pkgver=1.13.0
pkgrel=1
pkgdesc="A simple, keyboard-driven, markdown note-taking app"
arch=('any')
url="https://github.com/subvisual/notedown"
license=('MPL')
depends=('electron')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz" "notedown.desktop" "icon.png")
sha256sums=('34d7431688d373c71b0601ada7dc6f0163200109f5b176b030d5e3d2bda463e1' '9d8a2c3d6997360dc3d46bd7fe070d3cd55ff1c86f28abc1705703bf7cdbe4ea' '237f69269de51f3c36405a3ea95307793699c5e1730767cdab726d4e1c2fc11a')

package() {
  echo $srcdir
  mkdir -p ${pkgdir}/opt/${pkgname}
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/256x256/apps/
  mkdir -p ${pkgdir}/usr/share/applications/

  cp -r "${srcdir}/${pkgname}-${pkgver}/"* "${pkgdir}/opt/${pkgname}" -R
  cp "${srcdir}/notedown.desktop" "${pkgdir}/usr/share/applications/notedown.desktop"
  cp "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/notedown.png"

  # link executable to /usr/bin
  ln -s "/opt/${pkgname}/notedown" "${pkgdir}"/usr/bin/notedown

}
