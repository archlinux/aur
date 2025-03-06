# Maintainer: Antonio Voza <vozaanthony at gmail dot com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

_pkgname=WhiteSur-gtk-theme
_pkgver=2024-11-18
pkgname=whitesur-gtk-theme
pkgver="${_pkgver//-/.}"
pkgrel=1
pkgdesc='A macOS BigSur-like theme for your GTK apps.'
arch=('any')
url='https://github.com/vinceliuice/WhiteSur-gtk-theme'
license=('MIT')
makedepends=('sassc' 'which')
optdepends=(
  'gtk-engine-murrine: GTK2 theme support'
  'gtk-engines: GTK2 theme support'
  'whitesur-icon-theme: matching icon theme'
  'whitesur-cursor-theme: matching cursor theme'
)
conflicts=("${pkgname}-git")
install="${pkgname}.install"
source=(
  "${pkgname}-${_pkgver}.tar.gz::${url}/archive/${_pkgver}.tar.gz"
)
sha512sums=('07554d64c7cc4261f8b05ef710c2863385a035baadabebcb4acf89920e953afe40c2fa9a7faa078e6888a4de6e0d179e873608d15b82ee1ac13541d22e85d8b3')

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
