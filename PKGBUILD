# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=0x0uploader
pkgname="${_pkgname}-git"
pkgver=r35.6cb1eac
pkgrel=1
pkgdesc='Uploader for the 0x0 file sharing service.'
arch=('any')
url="https://codeberg.org/MorsMortium/${_pkgname}"
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('curl' 'hicolor-icon-theme')
optdepends=('xclip: X clipboard'
    'wl-clipboard: Wayland clipboard'
    'libnotify: Notifications')
sha512sums=('SKIP')
source=("${pkgname}::git+${url}.git")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 644 ${_pkgname}.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg
  install -Dm 755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  install -Dm 755 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}
