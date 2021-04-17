# Maintainer: 4679kun <4679kun@outlook.com>

pkgname=gnome-shell-extension-screenshotlocations-git
_gitname=gnome-shell-screenshotlocations-extension
pkgver=25.2948bc8
pkgrel=1
pkgdesc="Gnome-shell extension disabling hotcorners"
arch=('any')
url="https://github.com/TimurKiyivinski/gnome-shell-screenshotlocations-extension"
license=('GPLv2')
depends=('gnome-shell')
makedepends=('git')
source=('git://github.com/TimurKiyivinski/gnome-shell-screenshotlocations-extension')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  _uuid='screenshotlocations.timur@linux.com'
  
  cd "$_gitname/$_uuid"
  install -Dm644 "metadata.json" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/metadata.json"
  install -m644 "extension.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/extension.js"
  install -Dm644 "keybinder.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/keybinder.js"
  install -m644 "prefs.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/prefs.js"
}
