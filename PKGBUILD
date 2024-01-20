# Maintainer: Mark Wagie <mark dot wage at proton dot me>
# Contributor: XZS <d dot f dot fischer at web dot de>
pkgname=gnome-shell-extension-mpris-indicator-button-git
_uuid=mprisindicatorbutton@JasonLG1979.github.io
pkgver=r190.635d608
pkgrel=2
pkgdesc="A full featured MPRIS indicator button extension for GNOME Shell 3.38+"
arch=('any')
url="https://github.com/JasonLG1979/gnome-shell-extension-mpris-indicator-button"
license=('GPL-3.0-or-later')
depends=('gnome-shell<=1:44.6')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/JasonLG1979/gnome-shell-extension-mpris-indicator-button.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  install -d "$pkgdir/usr/share/gnome-shell/extensions"
  cp -r "$_uuid" "$pkgdir/usr/share/gnome-shell/extensions"
}
