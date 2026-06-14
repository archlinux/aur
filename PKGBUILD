# Maintainer: illusory <becomeillusory AT gmail DOT com>

_pkgname=WhiteSur-gtk-theme
_pkgver=2025-07-24
pkgname="whitesur-gtk-theme-custom"
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
conflicts=('whitesur-gtk-theme' "${pkgname}-git")
source=(
  "${pkgname}-${_pkgver}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz"
)
b2sums=('7d64e51eff9b76b7ceb07b379e43229e0285dff77c17d261ad95df3254fd178544dc831ce0b7e4d4e9db229ade502592451a39e855cdf6985def4a0ef3485e68')

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