# Maintainer: Rachit Kumar Pandey <rachitpandey@protonmail.com>

pkgname=plymouth-theme-arch-darwin
_themename=arch-darwin
pkgver=1.0
pkgrel=1
pkgdesc="Arch Linux splash screen for plymouth"
arch=("any")
url="https://github.com/armoredvortex/plymouth-theme-arch-darwin"
license=("MIT")
depends=("plymouth")
makedepends=("git")
source=("git+https://github.com/armoredvortex/plymouth-theme-arch-darwin.git")
md5sums=("SKIP")
package() {
  cd "${srcdir}/${pkgname}"
  _themedir="${pkgdir}/usr/share/plymouth/themes/$_themename"

  for N in "${_themename}.plymouth" assets/*.png "assets/${_themename}.script"; do
    install -Dm644 $N "${_themedir}/$N"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"

}
