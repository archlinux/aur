# Maintainer Victor Roest <victor@xirion.net>

pkgname=xcursor-breeze-neutral-git
pkgver=r9.08f15b2
pkgrel=2
pkgdesc="Neutral fork of KDEs Breeze Cursor"
url="https://github.com/TheScrawl/xcursor-breeze-neutral"
makedepends=('git')
depends=('libxcursor')
provides=('xcursor-breeze-neutral')
source=(git+https://github.com/TheScrawl/xcursor-breeze-neutral)
sha256sums=('SKIP')
arch=(any)

pkgver() {
  cd "xcursor-breeze-neutral"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    install -dm755 "$pkgdir"/usr/share/icons/
    cp -r ${srcdir}/xcursor-breeze-neutral $pkgdir/usr/share/icons/
}
