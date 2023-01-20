# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-weather-oclock-git
pkgver=3.r3.gf247e6f
pkgrel=1
pkgdesc="Display the current weather inside the pill next to the clock."
arch=('any')
url="https://github.com/CleoMenezesJr/weather-oclock"
license=('GPL3')
depends=('gnome-shell' 'gnome-weather')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/CleoMenezesJr/weather-oclock.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/weather-oclock"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/weather-oclock"
  _uuid=weatheroclock@CleoMenezesJr.github.io

  install -d "$pkgdir/usr/share/gnome-shell/extensions"
  cp -r "$_uuid" "$pkgdir/usr/share/gnome-shell/extensions/"
}
