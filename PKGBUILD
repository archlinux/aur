# Maintainer: quest <quest at mac dot com>

pkgname="celestial-gtk-theme"
pkgver=1.8.1
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
b2sums=('f167b866ca6d1978631d29381634a792726472e70d36d674e79da6f2f8e1c61b70e79c113cea4be3d5254bbce487bdbf40db18f6b01d8967e9c4eb1d06ff72f0')

package() {
  cd "${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/share/themes"
  install -d "${pkgdir}/usr/share/Kvantum"

  DESTDIR="${pkgdir}" ./install.sh -k -b --alacritty --copyq --cursors --ghostty --halloy --kitty --sniffnet --spotifast --telegram --ttk --zed --dest "/usr/share/themes"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  install -Dm644 INSTALL.md "${pkgdir}/usr/share/doc/${pkgname}/INSTALL.md"
}
