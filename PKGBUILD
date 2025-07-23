# Maintainer: Tuure Piitulainen <tuure.piitulainen@gmail.com>

_pkgname="windowlist"
pkgname="windowlist-git"
provides=("windowlist")
conflicts=("windowlist")
pkgver="v0.1.0.r0.g65c5729"
pkgrel=1
pkgdesc="Polybar custom module - List all open windows, click to switch focus or minimize"
arch=("x86_64")
url="https://github.com/tuurep/windowlist"
license=("MIT")
depends=("libx11" "glibc")
makedepends=("git")
source=("${pkgname}::git+${url}.git")
sha256sums=("SKIP")

pkgver() {
        cd "$pkgname"
        git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"
  BINDIR="$pkgdir/usr/bin" make install
  install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
