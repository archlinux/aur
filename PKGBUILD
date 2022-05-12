# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>
# Contributor: Nico <d3sox at protonmail dot com>

_pkgname=WhiteSur-icon-theme
_pkgver=2022-05-11

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
sha256sums=('45e0bb409e32f6cb4d746529fafbeda18a40376c11cfd5c04a44d74bba8aeefa')

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  install -dm755 "${pkgdir}/usr/share/icons"
  ./install.sh -d "${pkgdir}/usr/share/icons"
}
