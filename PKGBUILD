# Maintainer: quest <quest at mac dot com>

pkgname="celestial-gtk-theme"
pkgver=1.6.4
pkgrel=1
pkgdesc='A modern, customizable GTK theme with multiple color variants.'
arch=('any')
url="https://github.com/zquestz/$pkgname"
license=('GPL-3.0-or-later')
makedepends=('sassc' 'which')
optdepends=(
  'gtk-engine-murrine: GTK2 theme support'
  'gtk-engines: GTK2 theme support'
  'papirus-icon-theme: recommended icon theme'
  'kvantum: Qt theme support'
)
conflicts=("${pkgname}-git")
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
b2sums=('ed9ff6f7f3d2ff39c314deb656859664a75caefbada54eed1ec6db257c75683331875dcf7fc08a2140fc7b003dbc9e2c48e42843233f85b4c57283709f2f43ef')

package() {
  cd "${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/share/themes"
  install -d "${pkgdir}/usr/share/Kvantum"

  DESTDIR=${pkgdir} ./install.sh -k -b --copyq --cursors --ghostty --dest "/usr/share/themes"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
