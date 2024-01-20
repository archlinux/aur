# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-weather-in-the-clock-git
_uuid=weatherintheclock@JasonLG1979.github.io
pkgver=r27.38ba360
pkgrel=1
pkgdesc="Display the current Weather in the Clock."
arch=('any')
url="https://github.com/JasonLG1979/gnome-shell-extension-weather-in-the-clock"
license=('GPL-3.0-or-later')
depends=('gnome-shell<=1:44.6' 'gnome-weather')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/JasonLG1979/gnome-shell-extension-weather-in-the-clock.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  install -d "$pkgdir/usr/share/gnome-shell/extensions"
  cp -a $_uuid "$pkgdir/usr/share/gnome-shell/extensions"
}
