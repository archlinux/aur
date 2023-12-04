# Maintainer: joelvaz0x01 <joelvaz dot whitehat at gmail dot com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

_pkgname=WhiteSur-gtk-theme
_pkgver=2023-10-13

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
sha256sums=('1e100d836e72ef0d9d6ca122afca292439131933b04c992541af68767c9354f3')

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
