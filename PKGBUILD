# Maintainer: Alex S. shantanna_at_hotmail_dot_com>

pkgname=gnome-shell-extension-draw-on-your-screen-git
_pkgname=DrawOnYourScreen
pkgver=v11.r12.g4fdafc5
pkgrel=1
pkgdesc="A drawing extension for GNOME Shell."
arch=('any')
url="https://codeberg.org/som/DrawOnYourScreen"
license=('GPLv2')
conflicts=('gnome-shell-extension-draw-on-your-screen')
depends=('gnome-shell')
makedepends=('git')
#source=('git+https://codeberg.org/som/DrawOnYourScreen.git') # outdated
source=('git+https://codeberg.org/gigaSproule/DrawOnYourScreen.git')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  _extid='drawOnYourScreen@som.codeberg.org'
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
  cp -af "${_pkgname}" "${pkgdir}/usr/share/gnome-shell/extensions/"
  mv "${pkgdir}/usr/share/gnome-shell/extensions/${_pkgname}" "${pkgdir}/usr/share/gnome-shell/extensions/${_extid}"
  msg2 "Start drawing with Super+Alt+D. Then save your beautiful work by taking a screenshot."
}
