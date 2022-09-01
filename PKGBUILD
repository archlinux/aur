# Maintainer: Ayush Jha <ayushjha@pm.me>
pkgname=nekuvi
pkgver=0.2
pkgrel=1
epoch=
pkgdesc="नेपाली कुन्जीपेटि विन्यास A better layout for Nepali Keyboards based for xkb system"
arch=("any")
url="https://gitlab.com/ayys/nekuvi"
license=('GPL')
groups=()
depends=("xkeyboard-config")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("install.sh" "uninstall.sh" "level3_np" "np" "layout-evdev-install.hook" "layout-evdev-remove.hook")
sha256sums=('27bd5a76ef85a97a95248a5530446c3362064aab2146f8d7ceefdf8969a7a7c7'
            '0614ff1b4abd4fe0fb07cf95ebb60dee90180dadf19232b8e5fc94d75d67e555'
            'd5965a2ad14b8d9f6bed0bfdd37282dc1a67938577fa7fbe53d56be305583688'
            '819c86fecd6ec4a9ec57308fb00b13ffb040b238b29cf9564934d23692d4a917'
            '978abf768110916b04c10c3fd7690370b3e55d98090a5a411faf586ca8e48756'
            '3ec3ebb0324103f747b0e1ef7828664596b5db87ab82202a8213ed743025115b')


noextract=()
validpgpkeys=()

package() {
  set -euxo pipefail
  echo $pkgdir

  mkdir -p "$pkgdir"/usr/share/X11/xkb/symbols/
  mkdir -p "$pkgdir"/usr/share/X11/xkb/rules/
  cp level3_np "$pkgdir"/usr/share/X11/xkb/symbols/
  cp np "$pkgdir"/usr/share/X11/xkb/symbols/np_prog

  install -Dm 755 "${srcdir}"/install.sh "${pkgdir}/usr/share/libalpm/scripts/install-nekuvi-layout"
  install -Dm 755 "${srcdir}"/uninstall.sh "${pkgdir}/usr/share/libalpm/scripts/uninstall-nekuvi-layout"
  install -Dm 644 "${srcdir}"/layout-evdev-install.hook "${pkgdir}"/usr/share/libalpm/hooks/nekuvi-layout-evdev-install.hook
  install -Dm 644 "${srcdir}"/layout-evdev-remove.hook "${pkgdir}"/usr/share/libalpm/hooks/nekuvi-layout-evdev-remove.hook
}
