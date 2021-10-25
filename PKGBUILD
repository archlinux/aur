# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

_pkgname=WhiteSur-gtk-theme
_pkgver=2021-10-21

pkgname=whitesur-gtk-theme
pkgver="${_pkgver//-/.}"
pkgrel=1
pkgdesc="A macOS BigSur-like theme for your GTK apps"
arch=('any')
url="https://github.com/vinceliuice/WhiteSur-gtk-theme"
license=('MIT')
makedepends=('sassc')
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
sha256sums=(
  '13508b65b8cfc70023a4425944340cff4814106edfeadd9336bfbcb787b8320f'
)

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
