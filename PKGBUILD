# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-weather-oclock-git
_uuid=weatheroclock@CleoMenezesJr.github.io
pkgver=9.r0.gdf70dc2
pkgrel=1
pkgdesc="Display the current weather inside the pill next to the clock."
arch=('any')
url="https://github.com/CleoMenezesJr/weather-oclock"
license=('GPL-3.0-or-later')
depends=('gnome-shell' 'gnome-weather')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/CleoMenezesJr/weather-oclock.git')
sha256sums=('SKIP')

pkgver() {
  cd weather-oclock
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd weather-oclock
  install -d "$pkgdir/usr/share/gnome-shell/extensions"
  cp -r "$_uuid" "$pkgdir/usr/share/gnome-shell/extensions/"
}
