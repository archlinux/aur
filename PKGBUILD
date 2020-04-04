# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('arc-icon-theme-full-git')
pkgver=1.0.r109.g44aa818
pkgrel=3
pkgdesc='The complete Arc icon theme'
arch=('any')
url='https://github.com/rtlewis88/rtl88-Themes/tree/Arc-ICONS'
license=('GPL-3.0')
makedepends=('git')
optdepends=('arc-gtk-theme' 'arc-solid-gtk-theme')
provides=("${pkgname%-*}" "${pkgname}" "arc-icon-theme")
conflicts=("${pkgname%-*}" "${pkgname}" "arc-icon-theme")
options=('!strip')

pkgver() {
  cd "${srcdir}/rtl88-Themes/Arc-ICONS"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  msg2 'Downloading icons ...'
  git clone --single-branch --branch "Arc-ICONS" "https://github.com/rtlewis88/rtl88-Themes"
  cd "${srcdir}/rtl88-Themes/Arc-ICONS"
}

package() {
  msg2 'Installing icons ...'
  install -dm 755 "${pkgdir}/usr/share/icons/Arc-ICONS"
  cp -r "${srcdir}"/rtl88-Themes/Arc-ICONS/* "${pkgdir}/usr/share/icons/Arc-ICONS/"
}
# vim:set ts=2 sw=2 et: