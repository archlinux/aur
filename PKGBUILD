# Maintainer: nexttrex <jan@nexttrex.de>

pkgname='cinnamon-applet-weather-git'
pkgver=r538.8fa2b77
pkgrel=1
pkgdesc='Cinnamon desktop applet for displaying local weather conditions'
arch=('any')
url='https://github.com/mockturtl/cinnamon-weather'
license=('unknown')
depends=('cinnamon')
makedepends=('git')

# Use ccprog's fix for the yahoo api format
source=("$pkgname::git+https://github.com/mockturtl/cinnamon-weather.git")

sha256sums=('SKIP')
_appletname='weather@mockturtl'
_appletdir="usr/share/cinnamon/applets/$_appletname"

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"
  install -dm755 "$pkgdir/$_appletdir"
  find * -type f -exec install -Dm644 {} $pkgdir/$_appletdir/ \;
}
