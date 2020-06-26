pkgname=notedown
pkgver=1.5
filever=1.0.0
pkgrel=2
pkgdesc=""
arch=('any')
url="https://github.com/subvisual/notedown/releases/download/v$pkgver/$pkgname-$filever.tar.gz"
license=('MPL')
depends=('electron')
makedepends=('git')
source=($url "notedown.desktop" "icon.png")
noextract=()
md5sums=('SKIP' '647ca7e77794a5f19c47b5c37261372e' 'e6c3159888655d4ad8efcfc0816a0285')

package() {
  echo $srcdir
  mkdir -p ${pkgdir}/opt/${pkgname}
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/256x256/apps/
  mkdir -p ${pkgdir}/usr/share/applications/

  cp -r "${srcdir}/${pkgname}-${filever}/"* "${pkgdir}/opt/${pkgname}" -R
  cp "${srcdir}/notedown.desktop" "${pkgdir}/usr/share/applications/notedown.desktop"
  cp "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/notedown.png"

  # link executable to /usr/bin
  ln -s "${pkgdir}/opt/${pkgname}/notedown" "${pkgdir}"/usr/bin/notedown

}
