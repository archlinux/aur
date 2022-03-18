# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>
# Contributor: Nico <d3sox at protonmail dot com>

_pkgname=WhiteSur-icon-theme
_pkgver=2022-03-18

pkgname=whitesur-icon-theme
pkgver="${_pkgver//-/.}"
pkgrel=1
pkgdesc="MacOS Big Sur like icon theme for linux desktops"
arch=('any')
makedepends=('gtk-update-icon-cache')
optdepends=(
  'whitesur-gtk-theme: Recommended GTK theme'
  'whitesur-kde-theme: Recommended KDE theme'
  'whitesur-cursor-theme: Recommended cursor theme'
)
conflicts=("${pkgname}-git")
license=('GPL3')
url="https://github.com/vinceliuice/WhiteSur-icon-theme"
options=('!strip')
source=("${_pkgname}-${_pkgver}.tar.gz"::"${url}/archive/${_pkgver}.tar.gz")
sha256sums=('0572f65e78a88f6e2221a468a3623ea1b62cdbe5d617ea72ab67aeb823eaf11f')

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  install -dm755 "${pkgdir}/usr/share/icons"
  ./install.sh -d "${pkgdir}/usr/share/icons"
}
