# Maintainer: quest <quest at mac dot com>

pkgname="celestial-gtk-theme"
pkgver=1.8.2
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
b2sums=('900e31076aedd7169e636fccc4b7367144d598728bb56ded6b1143c338cd349ed9c1cc71adc0954f267f5d8f08580d4521632e4d691f635ebe1bf2a68fa3f580')

package() {
  cd "${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/share/themes"
  install -d "${pkgdir}/usr/share/Kvantum"

  DESTDIR="${pkgdir}" ./install.sh -k -b --alacritty --copyq --cursors --ghostty --halloy --kitty --sniffnet --spotifast --telegram --ttk --zed --dest "/usr/share/themes"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  install -Dm644 INSTALL.md "${pkgdir}/usr/share/doc/${pkgname}/INSTALL.md"
}
