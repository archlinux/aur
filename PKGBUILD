# Maintainer: Antonio Voza <vozaanthony at gmail dot com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

_pkgname=WhiteSur-gtk-theme
_pkgver=2024.09.02

pkgname=whitesur-gtk-theme
pkgver="${_pkgver//-/.}"
pkgrel=1
pkgdesc="A macOS BigSur-like theme for your GTK apps"
arch=('any')
url="https://github.com/vinceliuice/WhiteSur-gtk-theme"
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
sha512sums=('9c5b3d06de6254c1ff32042b3a365dc7b79c2a6d7c98ba852b07ca78faf2fb82bec29d458f03051069ca1acae77d5905ab5594dfc5db094a21f6f1b37631dc89')

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
