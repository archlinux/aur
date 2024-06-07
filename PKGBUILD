# Maintainer: Michael Serajnik <m at mser dot at>
pkgname=cproton-git
_pkgname=ProtonUpdater
pkgver=0.2.3
pkgrel=1
pkgdesc="Script to make it easier to update Proton GE to the latest version"
arch=("any")
url="https://github.com/kkleinw/ProtonUpdater"
license=("MIT")
makedepends=("git")
source=("git+https://github.com/kkleinw/ProtonUpdater.git")
sha512sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

package() {
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "$srcdir/$_pkgname/cproton.sh" "$pkgdir/usr/bin/cproton"
}
