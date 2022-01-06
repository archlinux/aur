# Maintainer: Mark Wagie <mark dot wage at tutanota dot com>
# Contributor: XZS <d dot f dot fischer at web dot de>
pkgname=gnome-shell-extension-mpris-indicator-button-git
pkgver=r183.11af7e8
pkgrel=1
pkgdesc="A full featured MPRIS indicator button extension for GNOME Shell 3.38+"
arch=('any')
url="https://github.com/JasonLG1979/gnome-shell-extension-mpris-indicator-button"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/JasonLG1979/gnome-shell-extension-mpris-indicator-button.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  _uuid='mprisindicatorbutton@JasonLG1979.github.io'

  install -d "$pkgdir/usr/share/gnome-shell/extensions"
  cp -r "$_uuid" "$pkgdir/usr/share/gnome-shell/extensions"
}
