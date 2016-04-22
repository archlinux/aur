# Maintainer: nexttrex <jan@nexttrex.de>

pkgname='cinnamon-applet-cpu-temperatur-git'
pkgver=r21.39e264f
pkgrel=1
pkgdesc='Shows CPU Temperature on Cinnamon panel'
arch=('any')
url='https://github.com/fevimu/cinnamon-applet-cpu-temperature'
license=('unknown')
depends=('cinnamon' 'lm_sensors')
makedepends=('git')
source=("$pkgname::git+https://github.com/fevimu/cinnamon-applet-cpu-temperature.git")
sha256sums=('SKIP')
_appletname='temperature@fevimu'
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
