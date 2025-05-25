# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Antonio Voza <vozaanthony at gmail dot com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

_pkgname=WhiteSur-gtk-theme
_pkgver=2025-04-03
pkgname="whitesur-gtk-theme"
pkgver="${_pkgver//-/.}"
pkgrel=1
pkgdesc='A macOS BigSur-like theme for your GTK apps.'
arch=('any')
url="https://github.com/vinceliuice/$_pkgname"
license=('MIT')
makedepends=('sassc' 'which')
optdepends=(
  'gtk-engine-murrine: GTK2 theme support'
  'gtk-engines: GTK2 theme support'
  'whitesur-icon-theme: matching icon theme'
  'whitesur-cursor-theme: matching cursor theme'
)
conflicts=("${pkgname}-git")
source=(
  "${pkgname}-${_pkgver}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz"
)
b2sums=('1d38b9b46a21d0f42d6ed3592ea1e57ddfbe65ac152df75b3a93b9367da1214c5430d65f04451b25a286fef540c1b23d5f81e2a273e343a7620de291d4c22a81')

package() {
  cd "${_pkgname}-${_pkgver}"
  install -d "${pkgdir}/usr/share/themes"

  # See for more customization options:
  # https://github.com/vinceliuice/WhiteSur-gtk-theme#theres-so-many-customizations-you-can-do
  ./install.sh \
    --dest "${pkgdir}/usr/share/themes"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
