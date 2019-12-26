# Maintainer: Michael Serajnik <ms dot mserajnik dot at>
pkgname=cproton-git
_pkgname=ProtonUpdater
pkgver=r11.d9fba2b
pkgrel=1
pkgdesc="Script to make it easier to update Proton GE to the latest version"
arch=('any')
url="https://github.com/flubberding/ProtonUpdater"
license=('unknown')
source=("git+https://github.com/flubberding/ProtonUpdater.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "$srcdir/$_pkgname/cproton.sh" "$pkgdir/usr/bin/cproton"
}
