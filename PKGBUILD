# Maintainer: Ayush Jha <ayushjha@pm.me>
pkgname=nekuvi-git
pkgver=0.1
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
source=("https://gitlab.com/saprasorg/nekuvi/-/raw/master/install.sh" "https://gitlab.com/saprasorg/nekuvi/-/raw/master/uninstall.sh" "https://gitlab.com/saprasorg/nekuvi/-/raw/master/level3_np" "https://gitlab.com/saprasorg/nekuvi/-/raw/master/np" "https://gitlab.com/saprasorg/nekuvi/-/raw/master/layout-evdev-install.hook" "https://gitlab.com/saprasorg/nekuvi/-/raw/master/layout-evdev-remove.hook")
sha256sums=('27bd5a76ef85a97a95248a5530446c3362064aab2146f8d7ceefdf8969a7a7c7'
            '0614ff1b4abd4fe0fb07cf95ebb60dee90180dadf19232b8e5fc94d75d67e555'
            'd5965a2ad14b8d9f6bed0bfdd37282dc1a67938577fa7fbe53d56be305583688'
            '819c86fecd6ec4a9ec57308fb00b13ffb040b238b29cf9564934d23692d4a917'
            'b4787622f07f2be1a94c2807bcc4c1d4e993e32f1cbf237bdc686f7930d26ca5'
            '3e334d271d5c43185cab000cda8117fa4bcd58412591d0b0a8566d68a010a5b6')


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
