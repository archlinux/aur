# Maintainer: Michael Serajnik <ms dot mserajnik dot at>
pkgname=cproton-git
_pkgname=ProtonUpdater
pkgver=0.2.1.r2.g0805f86
pkgrel=1
pkgdesc="Script to make it easier to update Proton GE to the latest version"
arch=('any')
url="https://github.com/flubberding/ProtonUpdater"
license=('MIT')
source=("git+https://github.com/flubberding/ProtonUpdater.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

package() {
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "$srcdir/$_pkgname/cproton.sh" "$pkgdir/usr/bin/cproton"
}
