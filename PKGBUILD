# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-weather-in-the-clock-git
pkgver=r23.b36cc55
pkgrel=1
pkgdesc="Display the current Weather in the Clock."
arch=('any')
url="https://github.com/JasonLG1979/gnome-shell-extension-weather-in-the-clock"
license=('GPL3')
depends=('gnome-shell' 'gnome-weather')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  _uuid='weatherintheclock@JasonLG1979.github.io'

  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/usr/share/gnome-shell/extensions"
  cp -a $_uuid "$pkgdir/usr/share/gnome-shell/extensions"
}
