# Maintainer: Jakub Wasylków <kuba_160@protonmail.com>
# Contributor: Justin Williams <justin@justinandyadi.com>

_pkgname=Workman
pkgname=workman-git
pkgver=r125.gec91fc3
pkgrel=1
pkgdesc="The Workman Keyboard Layout created by OJ Bucao."
url="https://workmanlayout.org/"
arch=('any')
license=('unknown')
depends=()
source=("${_pkgname}::git+https://github.com/workman-layout/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/${_pkgname}/xorg/
  install -Dm644 workman  ${pkgdir}/usr/share/X11/xkb/symbols/workman
  install -Dm644 workman-p  ${pkgdir}/usr/share/X11/xkb/symbols/workman-p

  cd ${srcdir}/${_pkgname}/linux_console/
  install -Dm644 workman.iso15.kmap ${pkgdir}/usr/share/kbd/keymaps/i386/workman/workman.map
  install -Dm644 workman-p.iso15.kmap ${pkgdir}/usr/share/kbd/keymaps/i386/workman/workman-p.map
}

