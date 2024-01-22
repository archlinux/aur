# Maintainer:  Sian1468 <sian1468-aur@.39011468.xyz>
# Contributor: Victor Roest <victor@xirion.net>

pkgname=xcursor-breeze-neutral-git
_pkgname=xcursor-breeze-neutral
pkgver=r12.f1f9624
pkgrel=2
pkgdesc="Neutral fork of KDEs Breeze Cursor"
license=(LicenseRef-None)
arch=(any)
url="https://github.com/TheScrawl/xcursor-breeze-neutral"
makedepends=('git')
depends=('libxcursor')
provides=('xcursor-breeze-neutral')
source=(git+https://github.com/TheScrawl/xcursor-breeze-neutral)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}
package() {
    install -dm755 "${pkgdir}"/usr/share/icons/"${_pkgname}"
    cp -r "${_pkgname}"/{cursors,index.theme} "${pkgdir}"/usr/share/icons/"${_pkgname}"
}
